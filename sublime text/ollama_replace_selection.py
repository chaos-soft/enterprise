import sublime
import sublime_plugin
import subprocess
import json
import threading


class OllamaClient:
    def __init__(self, host="localhost", port=11434):
        self.host = host
        self.port = port
        self.base_url = f"http://{host}:{port}"

    def is_ollama_running(self):
        """Check if Ollama server is running"""
        try:
            result = subprocess.run(
                ["curl", "-s", "--head", f"{self.base_url}/api/tags"],
                capture_output=True,
                text=True,
                timeout=5,
            )
            return result.returncode == 0
        except Exception:
            return False

    def list_models(self):
        """Get list of available models"""
        try:
            result = subprocess.run(
                ["curl", "-s", f"{self.base_url}/api/tags"],
                capture_output=True,
                text=True,
                timeout=10,
            )

            if result.returncode == 0:
                data = json.loads(result.stdout)
                return [model["name"] for model in data.get("models", [])]
            return []
        except Exception as e:
            print(f"Ollama error: {e}")
            return []

    def generate_response(self, model, prompt, stream=False):
        """Generate response using Ollama"""
        try:
            # Prepare the request payload
            payload = {"model": model, "prompt": prompt, "stream": stream}

            # For streaming, we'll handle it differently
            if stream:
                return self._generate_stream(model, prompt)
            else:
                result = subprocess.run(
                    [
                        "curl",
                        "-s",
                        "-X",
                        "POST",
                        f"{self.base_url}/api/generate",
                        "-H",
                        "Content-Type: application/json",
                        "--data",
                        json.dumps(payload),
                    ],
                    capture_output=True,
                    text=True,
                )

                if result.returncode == 0:
                    data = json.loads(result.stdout)
                    return data.get("response", "")
                return ""
        except Exception as e:
            print(f"Ollama error: {e}")
            return f"Error: {str(e)}"

    def _generate_stream(self, model, prompt):
        """Handle streaming response (simplified)"""
        try:
            payload = {"model": model, "prompt": prompt, "stream": True}

            # This is a simplified approach - real streaming would need
            # more complex handling
            result = subprocess.run(
                [
                    "curl",
                    "-s",
                    "-X",
                    "POST",
                    f"{self.base_url}/api/generate",
                    "-H",
                    "Content-Type: application/json",
                    "--data",
                    json.dumps(payload),
                ],
                capture_output=True,
                text=True,
            )

            if result.returncode == 0:
                # Parse and return the response
                data = json.loads(result.stdout)
                return data.get("response", "")
            return ""
        except Exception as e:
            print(f"Streaming error: {e}")
            return f"Error: {str(e)}"


class OllamaGenerateCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        # Check if Ollama is running
        ollama = OllamaClient()

        if not ollama.is_ollama_running():
            sublime.error_message(
                "Ollama server is not running. Please start Ollama first."
            )
            return

        # Get available models
        models = ollama.list_models()

        if not models:
            sublime.error_message("No models found. Please pull a model first.")
            return

        # Show model selection
        self.view.window().show_quick_panel(
            models, lambda index: self.on_model_selected(index, ollama)
        )

    def on_model_selected(self, index, ollama):
        if index == -1:
            return

        selected_model = self.get_models()[index]

        # Get the current selection or entire file content
        view = self.view
        selections = view.sel()

        if len(selections) > 0 and not selections[0].empty():
            # Use selected text
            selected_text = view.substr(selections[0])
        else:
            # Use entire file
            selected_text = view.substr(sublime.Region(0, view.size()))

        # Show input panel for prompt
        self.view.window().show_input_panel(
            "Ollama Prompt:",
            selected_text,
            lambda prompt: self.generate_response(prompt, selected_model, ollama),
            None,
            None,
        )

    def get_models(self):
        """Get list of available models (cached)"""
        ollama = OllamaClient()
        return ollama.list_models()

    def generate_response(self, prompt, model, ollama):
        # Show status
        self.view.window().status_message("Generating response...")

        # Run in background thread to avoid blocking UI
        def run_generate():
            try:
                response = ollama.generate_response(model, prompt)
                response = f"{prompt.strip()}\n\n{response.strip()}\n\n"
                self.view.run_command("append", {"characters": response})
            except Exception as e:
                error_msg = str(e)
                sublime.error_message(f"Generation failed: {error_msg}")

        threading.Thread(target=run_generate).start()


class OllamaStatusCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        ollama = OllamaClient()

        if not ollama.is_ollama_running():
            status = "Ollama is not running"
        else:
            models = ollama.list_models()
            if models:
                status = f"Ollama running with {len(models)} models"
            else:
                status = "Ollama running (no models)"

        self.view.window().status_message(status)
