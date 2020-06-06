#!/bin/bash

scriptnetinfo="./ip_info.sh"

addresses=$($scriptnetinfo |  sed -n '/IP Address:/ {
    s/\n\tIP Address:/IP Address:/
    p
}')

echo -e "\033[93m$addresses\033[0m"