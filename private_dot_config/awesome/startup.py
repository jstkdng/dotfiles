import subprocess
import shlex
import os
from pathlib import Path

log_file = Path.joinpath(Path.home(), Path(".local/share/xorg/Xorg.%s.log.old" % os.environ["DISPLAY"][-1]))

def main():
    if not log_file.exists():
        return

    program_list = [
        # Core stuff
        "/usr/bin/picom",
        "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1",
        "/usr/bin/xss-lock -n /usr/lib/xsecurelock/dimmer -l -- xsecurelock",
        "/usr/lib/geoclue-2.0/demos/agent",
        "/usr/bin/redshift-gtk",
        # Applets
        "/usr/bin/pasystray",
        # General applications
        "/usr/bin/mpd",
        "/usr/bin/variety",
        "/usr/bin/fcitx",
        "/usr/bin/nextcloud",
        # "/usr/bin/polybar default",
        "/usr/bin/udiskie",
        "/usr/bin/deluge-gtk",
        "/usr/bin/thunderbird",
        "/usr/bin/cbatticon",
        "/usr/bin/blueman-tray"
    ]
    for program in program_list:
        run(program)

    # Xorg.log.old file
    log_file.unlink()

def run(program):
    try:
        subprocess.Popen(shlex.split(program))
    except FileNotFoundError:
        pass

if __name__ == "__main__":
    main()
