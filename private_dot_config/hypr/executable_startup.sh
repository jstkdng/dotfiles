#!/bin/bash

#!/bin/bash

# Function to check if Waybar is active and running
check_waybar_status() {
    local output
    output=$(systemctl --user show waybar -p SubState,ActiveState)
    
    # Expected output
    local expected="ActiveState=active
SubState=running"
    
    # Compare the output with expected status
    if [[ "$output" == "$expected" ]]; then
        return 0  # Waybar is active and running
    else
        return 1  # Waybar is not in the desired state
    fi
}

run() {
    uwsm app -- "$@" &
}

# Wait until Waybar is active and running
while ! check_waybar_status; do
    sleep 1
done

run variety.desktop
run com.nextcloud.desktopclient.nextcloud.desktop
run org.keepassxc.KeePassXC.desktop
run org.mozilla.Thunderbird.desktop
run /usr/bin/udiskie
#run /usr/bin/blueman-applet

