#!/usr/bin/env python3
from pathlib import Path
from subprocess import PIPE, Popen, run
import sys

IF = Path('/mnt/alisa/memory card/резервные копии/игры/dark souls/fitgirl')
OF = '/mnt/larka/games/pfx/sh2/drive_c/users/steamuser/AppData/Roaming/DarkSoulsIII/0110000100000666/DS30000.sl2'

saves = {}
saves['вордт'] = IF / 'вордт/DS30000.sl2'
saves['доспехи'] = IF / 'доспехи/DS30000.sl2'
saves['дьяконы'] = IF / 'дьяконы/DS30000.sl2'
saves['маг'] = IF / 'маг/DS30000.sl2'
saves['новая'] = IF / 'новая/DS30000.sl2'
saves['понтифик'] = IF / 'понтифик/DS30000.sl2'
saves['скелет'] = IF / 'скелет/DS30000.sl2'
saves['танцовщица'] = IF / 'танцовщица/DS30000.sl2'
saves['текущая'] = IF / 'DS30000.sl2'
saves['хранители бездны'] = IF / 'хранители бездны/DS30000.sl2'
saves['цитадель фаррона'] = IF / 'цитадель фаррона/DS30000.sl2'

with Popen(['echo', '-n', '\n'.join(saves.keys())], stdout=PIPE) as echo:
    rofi = Popen(['rofi', '-dmenu', '-matching', 'prefix'], stdin=echo.stdout, stdout=PIPE)
k = rofi.communicate()[0].decode('utf-8').rstrip()
if k in saves:
    args = ['install', '-pDvm644', str(saves[k]), OF]
    print(run(args))
else:
    print('empty')

sys.exit(0)
