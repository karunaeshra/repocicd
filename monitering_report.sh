#!/bin/bash

# Display system resource usage
echo "System Monitoring Report"
echo "========================="

# CPU usage
echo -e "\nCPU Usage:"
top -bn1 | grep "Cpu(s)" | \
awk '{print "CPU Load: " $2 + $4 "%"}'

# Memory usage
echo -e "\nMemory Usage:"
free -h | awk '/^Mem/ {print "Used: "$3" / Total: "$2" (Free: "$4")"}'

# Disk usage
echo -e "\nDisk Usage:"
df -h --total | grep "total" | \
awk '{print "Used: "$3" / Total: "$2" (Available: "$4")"}'

echo -e "\nMonitoring completed."

