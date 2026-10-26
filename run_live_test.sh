#!/bin/bash
set -e

echo "=========================================================="
echo "🚀 VibeOS: Yangi toza 8080-portda ishga tushirilmoqda..."
echo "Muallif: backandchi | O'zbekiston"
echo "=========================================================="

# 1. Eski barcha jarayonlarni tozalash
killall -9 qemu-system-x86_64 websockify 2>/dev/null || true
sudo fuser -k 8080/tcp 2>/dev/null || true
sudo fuser -k 5902/tcp 2>/dev/null || true
sleep 1

# 2. noVNC index.html kafolati
if [ -f /usr/share/novnc/vnc.html ] && [ ! -f /usr/share/novnc/index.html ]; then
    sudo ln -s /usr/share/novnc/vnc.html /usr/share/novnc/index.html 2>/dev/null || sudo cp /usr/share/novnc/vnc.html /usr/share/novnc/index.html 2>/dev/null || true
fi

# 3. ISO fayli tekshirish
ISO="vibeos_final.iso"
if [ ! -f "$ISO" ]; then
    echo ">>> ISO yuklab olinmoqda..."
    curl -L https://github.com/backandchi/vibe-os/releases/download/v20261026/vibeos-desktop-linux-20261026.iso.part_aa > "$ISO"
    curl -L https://github.com/backandchi/vibe-os/releases/download/v20261026/vibeos-desktop-linux-20261026.iso.part_ab >> "$ISO"
fi

# 4. QEMU ni toza :2 (5902) ekranda yoqish
echo ">>> QEMU ishga tushmoqda..."
qemu-system-x86_64 -m 3G -smp 2 -cdrom "$ISO" -vga virtio -vnc 127.0.0.1:2 &
sleep 2

# 5. WebSockify ni 8080-portda yoqish
echo ">>> WebSockify 8080-portda ishga tushmoqda..."
websockify --web /usr/share/novnc 8080 127.0.0.1:5902 >/tmp/ws8080.log 2>&1 &
sleep 2

# 6. 8080 portini ochish
gh codespace ports visibility 8080:public -c hallowed-phantom-gx65rrvwx4j39p6 2>/dev/null || true

echo ""
echo "=========================================================="
echo "🎉 VIBEOS 8080-PORTDA ISHGA TUSHDI!"
echo "Havola orqali oching:"
echo "👉 https://hallowed-phantom-gx65rrvwx4j39p6-8080.app.github.dev/vnc.html"
echo "=========================================================="
