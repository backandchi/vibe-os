#!/bin/bash
set -e

echo "=========================================================="
echo "🚀 Yangi VibeOS v20261026 Ishga Tushirilmoqda..."
echo "Muallif: backandchi | O'zbekiston"
echo "=========================================================="

# Agar eski ISO bo'lsa uni olib tashlab, eng yangisini yuklash
if [ ! -f vibeos_v2.iso ]; then
    echo ">>> 1/3: Eng so'nggi VibeOS (v20261026) ISO yuklab olinmoqda..."
    curl -sL https://github.com/backandchi/vibe-os/releases/download/v20261026/vibeos-desktop-linux-20261026.iso.part_aa > vibeos_v2.iso
    curl -sL https://github.com/backandchi/vibe-os/releases/download/v20261026/vibeos-desktop-linux-20261026.iso.part_ab >> vibeos_v2.iso
    echo "✔ Yangi ISO tayyorlandi!"
fi

echo ">>> 2/3: QEMU tekshirilmoqda..."
if ! command -v qemu-system-x86_64 &>/dev/null || ! command -v websockify &>/dev/null; then
    sudo apt-get update -qq
    sudo apt-get install -y -qq qemu-system-x86 novnc websockify
fi

echo ">>> 3/3: VibeOS yangi ekrani 6080-portda yoqilmoqda..."
killall -9 qemu-system-x86_64 websockify 2>/dev/null || true
sleep 1
qemu-system-x86_64 -m 3G -smp 2 -cdrom vibeos_v2.iso -vga virtio -vnc :1 &
sleep 2
websockify --web /usr/share/novnc 6080 localhost:5901 &

sleep 2
echo ""
echo "=========================================================="
echo "🎉 YANGI VIBEOS (KDE PLASMA) JONLI ISHGA TUSHDI!"
echo "Havola: https://hallowed-phantom-gx65rrvwx4j39p6-6080.app.github.dev"
echo "=========================================================="
