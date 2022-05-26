import subprocess
import shlex
import os
import time
from pathlib import Path

def main():
    program_list = [
        # Core stuff
        "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1",
        "/usr/lib/geoclue-2.0/demos/agent",
        "/usr/bin/variety",
        "/usr/bin/fcitx5",
        "/usr/bin/udiskie",
        "/usr/bin/thunderbird",
        "/usr/bin/keepassxc",
        "/usr/bin/nheko",
        "/usr/bin/nextcloud",
    ]

    for program in program_list:
        run(program)

def run(program : str):
    logname = program.split("/")[3].split(" ")[0]
    log = open(Path.joinpath(Path.home(), Path(".local/share/sway/%s.log" % logname)), "w")

    try:
        if "nextcloud" in program:
            time.sleep(1.5)
        subprocess.Popen(shlex.split(program), stdout=log, stderr=log, shell=True)
    except FileNotFoundError:
        pass

if __name__ == "__main__":
    main()
