CHECK=$(screen -ls | grep PRT_00E)
if [ "$CHECK" == "" ]; then
        echo Starting V-Printer 00E Class A
        screen -S PRT_00E_CLASS_A -t PRT_00E_CLASS_A -d -m ~/virtual1403/virtual1403 --config ~/MVSCE/cfg1403.yaml
fi

CHECK=$(screen -ls | grep PRT_00F)
if [ "$CHECK" == "" ]; then
        echo Starting V-Printer 00F Class M
        screen -S PRT_00F_CLASS_M -t PRT_00E_CLASS_M -d -m ~/virtual1403/virtual1403 --config ~/MVSCE/cfg1404.yaml
fi

CHECK=$(screen -ls | grep PRT_015)
if [ "$CHECK" == "" ]; then
        echo Starting V-Printer 015 Class L
        screen -S PRT_015_CLASS_L -t PRT_015_CLASS_L -d -m ~/virtual1403/virtual1403 --config ~/MVSCE/cfg1405.yaml
fi

PID=$(pidof hercules)
if [ "$PID" == "" ]; then
        echo Starting Hercules
        screen -S MVSCE -t MVSCE -d -m ./start_mvs.sh
fi
