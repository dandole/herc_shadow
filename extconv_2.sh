#!/usr/bin/bash

sudo mkdir -p /mnt/iso

for iso in "${@:1}";
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
