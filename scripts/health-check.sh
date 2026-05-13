#!/bin/bash

echo "===== RHEL Web Infrastructure Health Check ====="

echo
echo "[1] Checking Podman container..."
if sudo podman ps | grep -q project-web; then
    echo "Container status: RUNNING"
else
    echo "WARNING: Container is NOT running"
fi

echo
echo "[2] Checking HTTP response..."
if curl -s http://localhost > /dev/null; then
    echo "Website response: OK"
else
    echo "WARNING: Website is NOT responding"
fi

echo
echo "[3] Checking port 80 listening..."
if ss -tulpn | grep -q ':80'; then
    echo "Port 80: LISTENING"
else
    echo "WARNING: Port 80 is NOT listening"
fi

echo
echo "[4] Checking disk usage..."
df -h /

echo
echo "===== Health Check Complete ====="