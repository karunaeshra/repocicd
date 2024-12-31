#!/bin/bash
echo "The current date and time is: $(date)"
echo "System Information Report"
echo "=========================="

# Hostname
echo -e "\nHostname:"
hostname

# Operating System and Kernel
echo -e "\nOperating System and Kernel:"
echo "OS: $(lsb_release -d | awk -F'\t' '{print $2}')"
echo "Kernel: $(uname -r)"

# CPU Information
echo -e "\nCPU Information:"
lscpu | grep "Model name" | awk -F: '{print $2}' | sed 's/^ *//'

# Memory Usage
echo -e "\nMemory Usage:"
free -h | awk '/^Mem/ {print "Used: "$3" / Total: "$2}'

# Disk Usage
echo -e "\nDisk Usage:"
df -h --total | grep "total" | awk '{print "Used: "$3" / Total: "$2" (Available: "$4)"}'

# Uptime
echo -e "\nSystem Uptime:"
uptime -p

echo -e "\nSystem information collected successfully."

