#!/usr/bin/env python3
from subprocess import run
import json
import sys


def main() -> int:
    current_workspace = 0
    output = []
    windows = {}
    r = run('niri msg --json windows', capture_output=True, shell=True)
    data = json.loads(r.stdout)
    for v in data:
        if v['is_focused']:
            current_workspace = v['workspace_id']
            break
    for i, v in enumerate(data):
        if v['workspace_id'] == current_workspace:
            # Плавающие окна.
            if v['layout']['pos_in_scrolling_layout'] is None:
                k = (1000 + i,)
                windows[k] = v
            else:
                k = tuple(v['layout']['pos_in_scrolling_layout'])
                windows[k] = v
    for _, v in sorted(windows.items()):
        if v['is_focused']:
            output.append({'title': v['title'], 'id': v['id'], 'is_focused': True})
        else:
            output.append({'title': v['title'], 'id': v['id']})
    print(json.dumps(output))
    return 0


sys.exit(main())
