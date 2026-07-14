from pathlib import Path
import subprocess

import sublime
import sublime_plugin

EXTENSIONS = {
    ".js": ["/home/chaos/node_modules/.bin/standard"],
    ".jsx": ["/home/chaos/node_modules/.bin/standard"],
    ".py": [
        "black",
        "flake8 --max-line-length 88"
        + " --ignore D100,D101,D102,D103,D104,D105,D106,D107,W503",
        "mypy --follow-imports skip --show-column-numbers --no-error-summary"
        + " --cache-dir /tmp/mypy_cache",
    ],
}


class LinterRunCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        file_path = self.view.file_name()
        commands = EXTENSIONS[Path(file_path).suffix]
        try:
            for command in commands:
                args = command.split(" ") + [file_path]
                result = subprocess.run(
                    args, capture_output=True, text=True, check=False
                )

                window = sublime.active_window()
                view = window.active_view()
                group, _ = window.get_view_index(view)

                if result.stdout:
                    print("\n\n{}:".format(args[0]))
                    print(result.stdout.rstrip())
                    window.run_command("show_panel", {"panel": "console"})
                    sublime.set_timeout(lambda: window.focus_group(group), 10)
                else:
                    print("\n\n{}: ok".format(args[0]))
                    window.run_command("hide_panel")
        except Exception:
            # sublime.error_message("Error running: {}".format(e))
            pass


class Linter(sublime_plugin.EventListener):
    def on_post_save_async(self, view):
        file_path = view.file_name()
        if file_path and Path(file_path).suffix in EXTENSIONS:
            view.run_command("linter_run")
