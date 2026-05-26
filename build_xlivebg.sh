#!/bin/sh
set -e

REPO="https://github.com/jtsiomb/xlivebg"

if command -v apt >/dev/null 2>&1; then
    echo "==> Installing build dependencies (apt)..."
    sudo apt install -y libx11-dev libxext-dev libxrandr-dev libglx-dev \
        libglu1-mesa-dev libpng-dev libjpeg-dev libmotif-dev
elif command -v pacman >/dev/null 2>&1; then
    echo "==> Installing build dependencies (pacman)..."
    sudo pacman -S --needed libx11 libxext libxrandr libgl libpng libjpeg-turbo openmotif
else
    echo "Unsupported package manager. Install deps manually then re-run."
    exit 1
fi

echo "==> Cloning xlivebg..."
git clone "$REPO" /tmp/xlivebg 2>/dev/null || (cd /tmp/xlivebg && git pull)

cd /tmp/xlivebg

echo "==> Configuring..."
./configure

echo "==> Building..."
make -j$(nproc)

echo "==> Installing..."
sudo make install-all

echo "==> Done! Run: xlivebg"
