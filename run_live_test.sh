#!/bin/bash
set -e

echo "=========================================================="
echo "🚀 VIBEOS (ENG SO'NGGI VERSIYA) ISHGA TUSHIRILMOQDA..."
echo "Muallif: backandchi | O'zbekiston"
echo "=========================================================="

# Eski kesh va fayllarni tozalash
rm -f vibeos.iso vibeos_v2.iso

if [ ! -f vibeos_final.iso ]; then
    echo ">>> 1/3: Eng yangi VibeOS ISO yuklab olinmoqda..."
    curl -L https://github.com/backandchi/vibe-os/releases/download/v20261026/vibeos-desktop-linux-20261026.iso.part_aa > vibeos_final.iso
    curl -L https://github.com/backandchi/vibe-os/releases/download/v20261026/vibeos-desktop-linux-20261026.iso.part_ab >> vibeos_final.iso
    echo "✔ Yangi ISO tayyorlandi ($(ls -lh vibeos_final.iso | awk '{print $5}'))"
fi

echo ">>> 2/3: Kerakli paketlar tekshirilmoqda..."
if ! command -v qemu-system-x86_64 &>/dev/null || ! command -v websockify &>/dev/null; then
    sudo apt-get update -qq
    sudo apt-get install -y -qq qemu-system-x86 novnc websockify
fi

echo ">>> 3/3: Virtual ekran yoqilmoqda..."
killall -9 qemu-system-x86_64 websockify 2>/dev/null || true
sleep 1
qemu-system-x86_64 -m 3G -smp 2 -cdrom vibeos_final.iso -vga virtio -vnc :1 &
sleep 2
websockify --web /usr/share/novnc 6080 localhost:5901 &

sleep 2
echo ""
echo "=========================================================="
echo "🎉 VIBEOS JONLI ISHGA TUSHDI!"
echo "Havola orqali oching:"
echo "👉 https://hallowed-phantom-gx65rrvwx4j39p6-6080.app.github.dev"
echo "=========================================================="
