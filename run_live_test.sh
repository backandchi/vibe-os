#!/bin/bash
set -e

echo "=========================================================="
echo "🚀 VibeOS Live Test Ishga Tushirilmoqda..."
echo "Muallif: backandchi"
echo "=========================================================="

echo ">>> 1/3: Eng so'nggi VibeOS ISO yuklab olinmoqda..."
curl -sL https://github.com/backandchi/vibe-os/releases/download/v20261025/vibeos-desktop-linux-20261025.iso.part_aa > vibeos.iso
curl -sL https://github.com/backandchi/vibe-os/releases/download/v20261025/vibeos-desktop-linux-20261025.iso.part_ab >> vibeos.iso
echo "✔ ISO muvaffaqiyatli tayyorlandi ($(ls -lh vibeos.iso | awk '{print $5}'))"

echo ">>> 2/3: QEMU va noVNC o'rnatilmoqda..."
sudo apt-get update -qq
sudo apt-get install -y -qq qemu-system-x86 novnc websockify

echo ">>> 3/3: VibeOS virtual ekrani 6080-portda yoqilmoqda..."
killall qemu-system-x86_64 websockify 2>/dev/null || true
qemu-system-x86_64 -m 4G -smp 4 -cdrom vibeos.iso -vga virtio -display vnc=:1 &
websockify --web /usr/share/novnc 6080 localhost:5901 &

sleep 3
echo ""
echo "=========================================================="
echo "🎉 VIBEOS JONLI ISHGA TUSHDI!"
echo "Quyidagi havola orqali brauzeringizda oching:"
echo "👉 https://hallowed-phantom-gx65rrvwx4j39p6-6080.app.github.dev"
echo "=========================================================="
