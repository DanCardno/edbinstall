#!/bin/bash

PS3='Please enter your choice: '
options=("EPAS11" "PEM" "MTK" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "EPAS-11")
            echo "Installing $opt"
            sudo chmod +x installedb11.sh
            sudo ./installedb11.sh
            ;;
        "PEM")
            echo "Installing $opt"
            sudo chmod +x ./installpem.sh
            sudo ./installpem.sh
            ;;
        "MTK")
            echo "Installing $opt"
            sudo chmod +x ./installmtk.sh
            sudo ./installmtk.sh
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

