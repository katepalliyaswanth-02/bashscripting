#!/bin/bash

# ============================================
# System Health Check Script - healthcheck.sh
# ============================================

echo "========================================"
echo "🔍 SYSTEM HEALTH CHECK"
echo "========================================"

# 1. System Date and Time
echo -e "\n📅 Date and Time:"
date

# 2. Uptime
echo -e "\n⏱️ Uptime:"
uptime

# 3. CPU Load (from uptime)
echo -e "\n💻 CPU Load (from uptime):"
uptime | awk -F'load average:' '{ print $2 }'

# 4. Memory Usage
echo -e "\n🧠 Memory Usage (free -m):"
free -m

# 5. Disk Usage
echo -e "\n💾 Disk Usage (df -h):"
df -h

# 6. Top 5 Memory-Consuming Processes
echo -e "\n🔥 Top 5 Memory-Consuming Processes:"
ps aux --sort=-%mem | head -n 6

# 7. Check if Services are Running
echo -e "\n🔎 Service Status Check:"
SERVICES=("nginx" "ssh")

for service in "${SERVICES[@]}"
do
    if systemctl is-active --quiet "$service"; then
        echo "✅ $service is running"
    else
        echo "❌ $service is NOT running"
    fi
done

echo -e "\n✅ Health check completed."
