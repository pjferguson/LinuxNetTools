#!/bin/bash
  
##
# BASH menu script that checks:
#   - Memory usage
#   - CPU load
#   - Number of TCP connections
#   - Advanced Net statistics
#   - Kernel version
##
  
server_name=$(hostname)
current_date=$(date +"%Y%m%d%H%M") 
_LOGFILE_="${HOME}/sys_${current_date}.log"
  
function memory_check() {
    echo -e "\nMemory usage on ${server_name} is: \n"
    free -h
}
  
function cpu_check() {
    echo -e "\nCPU load on ${server_name} is: \n"
    uptime
    echo ""
    cpu_idle=$(top -b -n 1 | grep Cpu | awk '{print $8}')
    if (( $(echo "$cpu_idle == 0.0" | bc -l) )) ; then 
        echo "CPU Usage is too HIGH"
    else
        echo "CPU Usage is normal"
    fi
}
 
function disk_check() {
    echo -e "\nDISK load on ${server_name} is: \n"
    vmstat 5 5
}
 
function tcp_check() {
    echo -e "\nTCP connections on ${server_name}: \n"
    cat  /proc/net/tcp | wc -l
    echo ""
}
 
function get_route() {
    echo -e "\nShow all routes for ${server_name}: \n"
    netstat -nrW
}
 
function kernel_check() {
    echo -e "\nKernel version on ${server_name} is: \n"
    uname -r
}
 
function adv_net() {
    echo -e "\nNetwork Statistics ${server_name} is: \n"
    netstat -s
    echo ""
    cat /proc/net/netstat > /tmp/netstat.csv ; sed  -i 's/ /,/g' /tmp/netstat.csv && cat /tmp/netstat.csv
}
  
function all_checks() {
memory_check
cpu_check
disk_check
tcp_check
get_route
kernel_check
adv_net
}
 
function save_checks() {
all_checks | tee -a ${_LOGFILE_}
}
  
##
# Color  Variables
##
green='\e[32m'
blue='\e[34m'
red='\e[31m'
clear='\e[0m'
  
##
# Color Functions
##
  
ColorGreen(){
echo -ne $green$1$clear
}
ColorBlue(){
echo -ne $blue$1$clear
}
  
menu(){
echo -ne "
My First Menu
$(ColorGreen '1)') Memory usage
$(ColorGreen '2)') CPU load
$(ColorGreen '3)') Number of TCP connections
$(ColorGreen '4)') Routing Table
$(ColorGreen '5)') Kernel version
$(ColorGreen '6)') Network Statistics
$(ColorGreen '7)') Check All
$(ColorGreen '8)') Save Checks
$(ColorGreen '0)') Exit
$(ColorBlue 'Choose an option:') "
read a
    case $a in
        1) memory_check ; sleep 5 ; menu ;;
        2) cpu_check ; sleep 5 ; menu ;;
        3) tcp_check ; sleep 5 ; menu ;;
        4) get_route ; sleep 5 ; menu ;;
        5) kernel_check ; sleep 5 ; menu ;;
        6) adv_net ; sleep 5 ; menu ;;
        7) all_checks ; sleep 5 ; menu ;;
        8) save_checks ; sleep 5 ; menu ;;
        0) echo "bye..." ; sleep 3 ; exit 0 ;;
        *) echo -e $red"Wrong option."$clear;;
    esac
}
  
# Call the menu function
menu
