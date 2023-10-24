#!/usr/bin/bash

sudo mkdir -p /mnt/freenas
sudo mkdir -p /mnt/iso

sudo mount -t cifs //shareserver/SoftwareShare /mnt/freenas/ -o username=homeuser,password=password

for iso in /mnt/freenas/Mainframe/ZOS\ 1.11/RDzUnitTest_v803_SYSzSWdist_disc?.iso;
do
        echo "Mounting ${iso}"
        sudo mount "${iso}" /mnt/iso -o loop;
        for gz in $(find /mnt/iso -name '*.gz');
        do
                echo "Processing ${gz}"
                STEM=$(basename "${gz}" .gz);
                gunzip -c "${gz}" > "${STEM}".ckd;
                ckd2cckd64 -q "${STEM}".ckd "${STEM}".cckd;
                rm "${STEM}".ckd;
        done;
        sudo umount /mnt/iso;
done

sudo umount /mnt/freenas

