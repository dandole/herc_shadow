#!/usr/bin/bash

if ! [ -f step1 ]; then
        echo "STEP ONE - Ubuntu Updates"
        sudo apt update
        sudo apt upgrade -y
        sudo apt install avahi-autoipd avahi-daemon avahi-discover avahi-utils -y
        sudo apt install c3270 - y
        echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCrHg026OL249iNRGLZKHlaeTikbfDmahkH2Dp/w+i4vrt/yN/ZEFNksl8GmCSoa3OtJ4xRu/lTSGrFGiWnDWIXd9lRPSrJA+L5vOJeSxZbJRAq4g3m/QCbmkyUkTUyxbJ+CHAMZ2UtVjE5g0yI54UY1rlUHu9mPT1rquGIOwLgE5X3p8Ssikx2H5CjNR1mn4pldPoUaRsUB5sZYUWThQ+Gu4BTfE3NglkdBymM0aGbRNBz7h7newnZsSquqoD2az/Lm6OI1JGHQqU8xBFNvZqWDDq4EqGOWPMy19qr1ln82kLWoofswXVfggEVCoyWwqgztGNVgcy/qCx1ukYEaK03 rsa-key-20230317" >> .ssh/authorized_keys
        touch step1
        sudo reboot & exit
fi

if ! [ -f step2 ]; then
        echo "STEP TWO - Hercules Build"
        mkdir herc
        git clone https://github.com/wrljet/hercules-helper.git
        cd herc
        ~/hercules-helper/hercules-buildall.sh --auto --flavor=aethra
        touch step2
        sudo reboot & exit
fi
