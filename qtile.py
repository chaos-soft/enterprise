# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from libqtile import bar, layout, widget, qtile
from libqtile.backend.wayland import InputConfig
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from pathlib import Path


@lazy.function
def choose_left_window(qtile):
    i = qtile.current_group.windows.index(qtile.current_window) - 1
    if i > -1:
        qtile.switch_window(i + 1)
    else:
        qtile.switch_window(len(qtile.current_group.windows))
    qtile.current_window.bring_to_front()


@lazy.function
def choose_right_window(qtile):
    i = qtile.current_group.windows.index(qtile.current_window) + 2
    if i <= len(qtile.current_group.windows):
        qtile.switch_window(i)
    else:
        qtile.switch_window(1)
    qtile.current_window.bring_to_front()


@lazy.function
def move_window_left(qtile):
    i = qtile.current_group.windows.index(qtile.current_window) - 1
    if i > -1:
        qtile.change_window_order(i + 1)
    else:
        qtile.change_window_order(len(qtile.current_group.windows))
    bar = qtile.screens[0].top
    bar.draw()


@lazy.function
def move_window_right(qtile):
    i = qtile.current_group.windows.index(qtile.current_window) + 2
    if i <= len(qtile.current_group.windows):
        qtile.change_window_order(i)
    else:
        qtile.change_window_order(1)
    bar = qtile.screens[0].top
    bar.draw()


COLORS = ['#d8dee9', '#252a33', '#3b4252']
HOME = Path.home()

mod = "mod4"
terminal = 'xfce4-terminal -e ranger'

keys = [
    Key(['control'], "F10", lazy.spawn('amixer -q set Capture toggle')),
    Key([], "F10", lazy.spawn('amixer -q set Master toggle')),
    Key([], "XF86AudioLowerVolume", lazy.spawn('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-')),
    Key([], "XF86AudioMute", lazy.spawn('amixer -q set Master toggle')),
    Key([], "XF86AudioRaiseVolume", lazy.spawn('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+')),

    Key(['control'], "1", lazy.spawn(f'{HOME}/Documents/enterprise/scripts/rofi.py')),
    Key(['control'], "2", lazy.spawn('rofi -show drun -matching prefix')),
    Key(['control'], "3", lazy.spawn(f'{HOME}/Documents/enterprise/scripts/rofi_ds3.py')),
    Key(['control'], "4", lazy.spawn(f'{HOME}/Documents/enterprise/scripts/yad.py')),
    Key(['control'], "q", lazy.window.kill(), desc="Kill focused window"),
    Key(['control'], "tab", choose_right_window),
    Key([], "insert", lazy.spawn("sh -c 'sleep 0.1 && xdotool key --delay 100 space Ctrl+Left space'")),
    Key([], "print", lazy.spawn("sh -c 'xfce4-screenshooter -f -s ~/Pictures/$(date +%Y%m%d-%H%M%S).png'")),
    Key([mod, "shift"], "c", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "shift"], "e", lazy.spawn('xfce4-session-logout')),
    Key([mod, "shift"], "left", move_window_left),
    Key([mod, "shift"], "right", move_window_right),
    Key([mod, "shift"], "space", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod], "a", lazy.spawn(f'obs-gamecapture {HOME}/tmp/bin/ariel.sh')),
    Key([mod], "left", choose_left_window),
    Key([mod], "page_down", lazy.screen.next_group(skip_empty=True)),
    Key([mod], "page_up", lazy.screen.prev_group(skip_empty=True)),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "right", choose_right_window),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
]

# Add key bindings to switch VTs in Wayland.
# We can't check qtile.core.name in default config as it is loaded before qtile is started
# We therefore defer the check until the key binding is run by using .when(func=...)
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )


groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc=f"Switch to group {i.name}",
            ),
            Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
                desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    layout.Max(margin=[0, 0, 0, 0], only_focused=False),
]

widget_defaults = dict(
    font='sans',
    fontsize=14,
    foreground=COLORS[0],
    highlight_method='block',
    padding=3,
    rounded=False,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    active=COLORS[0],
                    hide_unused=True,
                    inactive=COLORS[0],
                    margin_x=0,
                    padding_x=15,
                    this_current_screen_border=COLORS[2],
                ),
                widget.TaskList(
                    border=COLORS[2],
                    margin=0,
                    title_width_method='uniform',
                ),
                widget.GenPollCommand(
                    cmd=HOME / 'Documents/enterprise/scripts/status_command.sh',
                    update_interval=1,
                ),
            ],
            22,
            background=COLORS[1],
            margin=[0, 0, 0, 0],
        ),
        wallpaper='/mnt/alisa/memory card/изображения/скриншоты/история/20210420-015850.png',
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    border_focus=COLORS[0],
    border_normal=COLORS[0],
    border_width=2,
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(title="Authentication required"),
        Match(title="Disks"),
        Match(title="galculator"),
        Match(wm_class="ariel"),
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = False

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = False

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = {
    '*': InputConfig(accel_profile='flat', pointer_accel=-0.3),
    'type:keyboard': InputConfig(kb_options='grp:caps_toggle,grp_led:scroll', kb_layout='us,ru', kb_repeat_delay=200),
}

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = 'Breeze_Contrast'
wl_xcursor_size = 24

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
