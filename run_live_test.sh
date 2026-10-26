#!/bin/bash
set -e

echo "=========================================================="
echo "🚀 VibeOS: Cloudflare Ultra-Tunnel orqali ishga tushirish..."
echo "Muallif: backandchi | O'zbekiston"
echo "=========================================================="

# 1. Eski jarayonlarni tozalash
killall -9 qemu-system-x86_64 websockify cloudflared 2>/dev/null || true
sudo fuser -k 8080/tcp 2>/dev/null || true
sudo fuser -k 5902/tcp 2>/dev/null || true
sleep 1

# 2. noVNC index.html kafolati
if [ -f /usr/share/novnc/vnc.html ] && [ ! -f /usr/share/novnc/index.html ]; then
    sudo ln -s /usr/share/novnc/vnc.html /usr/share/novnc/index.html 2>/dev/null || sudo cp /usr/share/novnc/vnc.html /usr/share/novnc/index.html 2>/dev/null || true
fi

# 3. ISO tekshirish
ISO="vibeos_final.iso"
if [ ! -f "$ISO" ]; then
    echo ">>> ISO yuklab olinmoqda..."
    curl -L https://github.com/backandchi/vibe-os/releases/download/v20261026/vibeos-desktop-linux-20261026.iso.part_aa > "$ISO"
    curl -L https://github.com/backandchi/vibe-os/releases/download/v20261026/vibeos-desktop-linux-20261026.iso.part_ab >> "$ISO"
fi

# 4. QEMU yoqish
echo ">>> QEMU ishga tushmoqda..."
qemu-system-x86_64 -m 3G -smp 2 -cdrom "$ISO" -vga virtio -vnc 127.0.0.1:2 &
sleep 2

# 5. WebSockify yoqish
echo ">>> WebSockify ishga tushmoqda..."
websockify --web /usr/share/novnc 8080 127.0.0.1:5902 >/tmp/ws.log 2>&1 &
sleep 2

# 6. Cloudflare Tunnel orqali 100% to'g'ridan-to'g'ri ochiq global havola yaratish (404 bo'lmaydi!)
echo ">>> Xavfsiz global tunnel o'rnatilmoqda..."
if [ ! -f /tmp/cloudflared ]; then
    curl -sL https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -o /tmp/cloudflared
    chmod +x /tmp/cloudflared
fi

/tmp/cloudflared tunnel --url http://localhost:8080 >/tmp/cf.log 2>&1 &
sleep 5

CF_URL=$(grep -o 'https://[-a-zA-Z0-9.]*\.trycloudflare\.com' /tmp/cf.log | head -n 1)

echo ""
echo "=========================================================="
echo "🎉 VIBEOS GLOBAL TUNNEL ORQALI TAYYOR BO'LDI!"
if [ -n "$CF_URL" ]; then
    echo "To'g'ridan-to'g'ri bosing (100% ochiladi, 404 bo'lmaydi):"
    echo "👉 ${CF_URL}/vnc.html"
else
    echo "Havola log faylda: cat /tmp/cf.log"
fi
echo "=========================================================="
