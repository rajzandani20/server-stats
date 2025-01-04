#!/bin/bash

# Function to display total CPU usage
get_cpu_usage() {
  echo "CPU Usage:"
  top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}'
  echo
}

# Function to display total memory usage
get_memory_usage() {
  echo "Memory Usage:"
  mem_used=$(free -m | grep Mem | awk '{print $3}')
  mem_total=$(free -m | grep Mem | awk '{print $2}')
  mem_percent=$(( 100 * $mem_used / $mem_total ))
  echo "Used: ${mem_used}Mi / Total: ${mem_total}Mi (${mem_percent}%)"
  echo
}

# Function to display total disk usage
get_disk_usage() {
  echo "Disk Usage:"
  df -h | grep -E '^/dev' | awk '{print $1 ": " $3 " used / " $4 " available (" $5 ")"}'
  echo
}

# Function to display top 5 processes by CPU usage
get_top_cpu_processes() {
  echo "Top 5 Processes by CPU Usage:"
  ps aux --sort=-%cpu | awk 'NR<=6 {print $1, $3, $11}'  # Skip header
  echo
}

# Function to display top 5 processes by memory usage
get_top_memory_processes() {
  echo "Top 5 Processes by Memory Usage:"
  ps aux --sort=-%mem | awk 'NR<=6 {print $1, $4, $11}'  # Skip header
  echo
}

# Stretch Goal: Display additional stats (OS version, uptime, load average, logged-in users, failed login attempts)
get_additional_stats() {
  echo "Additional Stats:"
  echo "OS Version: $(lsb_release -d | cut -f2-)"
  echo "Uptime: $(uptime -p)"
  echo "Load Average: $(uptime | awk -F'load average:' '{print $2}')"
  echo "Logged-in Users: $(who | wc -l)"
  echo "Failed Login Attempts: $(grep 'Failed' /var/log/auth.log | wc -l)"
  echo
}

# Display all stats
get_cpu_usage
get_memory_usage
get_disk_usage
get_top_cpu_processes
get_top_memory_processes
get_additional_stats
