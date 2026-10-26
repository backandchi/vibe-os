#!/bin/bash
set -e

echo ">>> QEMU va websockify tozalanmoqda..."
sudo fuser -k 6080/tcp 2>/dev/null || true
sudo fuser -k 5901/tcp 2>/dev/null || true
killall -9 qemu-system-x86_64 websockify 2>/dev/null || true
sleep 1

# noVNC index.html ni kafolatli yaratish (404 bo'lmasligi uchun)
if [ -f /usr/share/novnc/vnc.html ] && [ ! -f /usr/share/novnc/index.html ]; then
    sudo ln -s /usr/share/novnc/vnc.html /usr/share/novnc/index.html 2>/dev/null || sudo cp /usr/share/novnc/vnc.html /usr/share/novnc/index.html 2>/dev/null || true
fi

# ISO faylini tekshirish (agar bo'lmasa yuklash)
ISO_FILE="vibeos_final.iso"
if [ ! -f "$ISO_FILE" ]; then
    echo ">>> ISO yuklab olinmoqda..."
    curl -L https://github.com/backandchi/vibe-os/releases/download/v20261026/vibeos-desktop-linux-20261026.iso.part_aa > "$ISO_FILE"
    curl -L https://github.com/backandchi/vibe-os/releases/download/v20261026/vibeos-desktop-linux-20261026.iso.part_ab >> "$ISO_FILE"
fi

echo ">>> QEMU virtual mashinasi yoqilmoqda..."
qemu-system-x86_64 -m 3G -smp 2 -cdrom "$ISO_FILE" -vga virtio -vnc 127.0.0.1:1 &
sleep 2

echo ">>> WebSockify yoqilmoqda..."
websockify --web /usr/share/novnc 6080 127.0.0.1:5901 >/tmp/ws.log 2>&1 &
sleep 2

# Portni avtomat public qilish
gh codespace ports visibility 6080:public 2>/dev/null || true

echo ""
echo "=========================================================="
echo "✔ VIBEOS 100% TAYYOR VA ISHLAMOQDA!"
echo "Havola (to'g'ridan-to'g'ri bosing):"
echo "👉 https://${CODESPACE_NAME}-6080.app.github.dev/vnc.html"
echo "=========================================================="
