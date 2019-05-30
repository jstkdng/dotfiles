import subprocess
import shlex
from pathlib import Path

log_file = Path.joinpath(Path.home(), Path(".local/share/xorg/Xorg.0.log.old"))

def main():
    if not log_file.exists():
        return

    program_list = [
        # Core stuff
        "/usr/bin/compton",
        "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1",
        "/usr/bin/xss-lock -- betterlockscreen -l dim",
        # Applets
        "/usr/bin/pa-applet",
        # General applications
        "/usr/bin/mpd",
        "/usr/bin/variety",
        "/usr/bin/fcitx",
        "/usr/bin/nextcloud",
        "/usr/bin/polybar default"
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
