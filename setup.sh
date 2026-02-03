#!/bin/bash
cd
if [ -e "/data/data/com.termux/files/home/storage" ]; then
	rm -rf /data/data/com.termux/files/home/storage
fi
termux-setup-storage
yes | pkg update
. <(curl https://raw.githubusercontent.com/caot60002/test2/refs/heads/main/termux-change-repo.sh)
yes | pkg upgrade
yes | pkg i python
yes | pkg i python-pip
pip install requests prettytable pycryptodome asyncio pyjwt ecdsa
export CFLAGS="-Wno-error=implicit-function-declaration"
pip install psutil
pip install pytz
curl -Ls "https://raw.githubusercontent.com/caot60002/test2/refs/heads/main/main.py" -o /sdcard/Download/ToiLaTu.py
