# change ip zyxel router

This script will help you to automatically change the ip address on the ZYXEL routers through telnet protocol, if your provider provides both NAT-ranges, and external IP addresses.

files description:

check_ip.sh - bash script for linux

TST10.exe - telnet utility.

read_interface.telnet - config file for telnet utility to read interface info (ip address).

release_ip.telnet - config file for telnet utility to change ip address.


Этот скрипт поможет вам автоматически менять ip адрес на маршрутизаторах ZYXEL по протоколу Telnet, если ваш провайдер выдает вам IP как из NAT-диапазонов, так и внешние "белые" IP-адреса.

Файлы описание:

check_ip.sh - Bash скрипт для Linux

TST10.exe - Telnet утилита

read_interface.telnet - конфигурационный файл для Telnet утилиты для чтения информации интерфейса (IP-адрес).

release_ip.telnet - конфигурационный файл для telnet утилиты по смене IP-адреса.
