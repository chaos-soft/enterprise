import sublime_plugin


class UniqueSortCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        view = self.view
        selections = view.sel()
        if not selections:
            return None
        selected_region = selections[0]
        if selected_region.empty():
            return None

        separators = (("\n", "\n"), ("|", "|"), (",", ", "), (" ", " "))
        text = view.substr(selected_region)
        for sep in separators:
            if sep[0] in text:
                data = list(
                    set(filter(bool, map(lambda v: v.strip(), text.split(sep[0]))))
                )
                data.sort()
                corrected = sep[1].join(data)
                break
        view.replace(edit, selected_region, corrected)
