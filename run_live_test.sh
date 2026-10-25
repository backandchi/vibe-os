#!/bin/bash
set -e

echo "=========================================================="
echo "🚀 VibeOS Live Test Ishga Tushirilmoqda..."
echo "Muallif: backandchi"
echo "=========================================================="

if [ -f vibeos.iso ] && [ $(stat -c%s vibeos.iso 2>/dev/null || stat -f%z vibeos.iso) -gt 2000000000 ]; then
    echo "✔ vibeos.iso allaqachon mavjud, qayta yuklanmaydi!"
else
    echo ">>> 1/3: VibeOS ISO yuklab olinmoqda..."
    curl -sL https://github.com/backandchi/vibe-os/releases/download/v20261025/vibeos-desktop-linux-20261025.iso.part_aa > vibeos.iso
    curl -sL https://github.com/backandchi/vibe-os/releases/download/v20261025/vibeos-desktop-linux-20261025.iso.part_ab >> vibeos.iso
fi

echo ">>> 2/3: Kerakli dasturlar tekshirilmoqda..."
if ! command -v qemu-system-x86_64 &>/dev/null || ! command -v websockify &>/dev/null; then
    sudo apt-get update -qq
    sudo apt-get install -y -qq qemu-system-x86 novnc websockify
fi

echo ">>> 3/3: VibeOS virtual ekrani 6080-portda yoqilmoqda..."
killall qemu-system-x86_64 websockify 2>/dev/null || true
sleep 1
qemu-system-x86_64 -m 4G -smp 4 -cdrom vibeos.iso -vga virtio -display vnc=:1 &
websockify --web /usr/share/novnc 6080 localhost:5901 &

sleep 2
echo ""
echo "=========================================================="
echo "🎉 VIBEOS JONLI ISHGA TUSHDI!"
echo "Havola: https://hallowed-phantom-gx65rrvwx4j39p6-6080.app.github.dev"
echo "=========================================================="
