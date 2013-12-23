from libqtile.manager import Key, Screen, Group
from libqtile.command import lazy
from libqtile import layout, bar, widget


mod = 'mod1'

keys = [
    Key([mod], 'k', lazy.layout.down()),
    Key([mod], 'j', lazy.layout.up()),
    Key([mod, 'control'], 'k', lazy.layout.shuffle_down()),
    Key([mod, 'control'], 'j', lazy.layout.shuffle_up()),

    Key([mod], 'Tab', lazy.nextlayout()),
    Key([mod], 'space', lazy.layout.next()),
    Key([mod, 'shift'], 'space', lazy.layout.rotate()),
    Key([mod, 'shift'], 'Return', lazy.layout.toggle_split()),

    Key([mod], 'h', lazy.to_screen(1)),
    Key([mod], 'l', lazy.to_screen(0)),

    Key([mod, 'control'], 'r', lazy.restart()),
    Key([mod, 'control'], 'e', lazy.shutdown()),

    Key([mod], 'Return', lazy.spawn('gnome-terminal')),
    Key([mod], 'd', lazy.spawn('dmenu_run')),
    Key([mod], 'q', lazy.window.kill()),

]

group_names = [
    ("code1", {}),
    ("code2", {}),
    ("web", {'layout': 'max'}),
    ("email", {'layout': 'max'}),
    ("chat", {'layout': 'tile'}),
]

groups = [
    Group(name, **kwargs)
    for name, kwargs in group_names
]

for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name)))


layouts = [
    layout.Max(),
    # layout.Floating(),
    # layout.MonadTall(border_normal='#222222'),
    layout.RatioTile(),
    # layout.Slice(),
    layout.Stack(stacks=2),
    layout.Tile(),
    # layout.TreeTab(),
    # layout.Zoomy(),
]

screens = [
    Screen(
        bottom = bar.Bar(
            [
                widget.GroupBox(),
                widget.CurrentLayout(),
                widget.WindowName(),
                # widget.Notify(),
                widget.Prompt(),
                widget.Systray(),
                # widget.TextBox('default', 'default config'),
            ],
            30,
        ),
    ),
]

