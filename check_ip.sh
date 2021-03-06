#!/bin/bash
# check white ip v.0.1
#
# variables:
# check & set parameters
SLEEP_TIMEOUT=2
LOGIN=user
PASSWORD=pass
HOST=192.168.0.1
PORT=23
IP_PATTERN=8.8.
LOG_FILE=/var/log/check_ip.log
#
# functions:
#
READ_IP() {
IP_ADDRESS=`(
    sleep ${SLEEP_TIMEOUT}
    echo "${LOGIN}"
    sleep ${SLEEP_TIMEOUT}
    echo "${PASSWORD}"
    sleep ${SLEEP_TIMEOUT}
    echo "show interface ISP"
    sleep ${SLEEP_TIMEOUT}
    echo "exit"
    ) | telnet ${HOST} ${PORT} | grep "address: " | tee -a ${LOG_FILE} | grep "${IP_PATTERN}"`
}

CHANGE_IP() {
(
    sleep ${SLEEP_TIMEOUT}
    echo "${LOGIN}"
    sleep ${SLEEP_TIMEOUT}
    echo "${PASSWORD}"
    sleep ${SLEEP_TIMEOUT}
    echo "interface ISP"
    sleep ${SLEEP_TIMEOUT}
    echo "ip dhcp client release"
    sleep ${SLEEP_TIMEOUT}
    echo "exit"
    ) | telnet ${HOST} ${PORT}
}
#
# main code
#
echo "`date +%Y-%m-%d_%H-%M-%S` start:" >> ${LOG_FILE}
READ_IP

while [ -z "${IP_ADDRESS}" ]
do
    echo "`date +%Y-%m-%d_%H-%M-%S`     change ip." >> ${LOG_FILE}
    CHANGE_IP
    sleep 10
    READ_IP
done
