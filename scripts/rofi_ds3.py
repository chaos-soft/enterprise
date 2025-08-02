#!/usr/bin/env python3
from pathlib import Path
from subprocess import run
import sys

IF: Path = Path('/mnt/alisa/memory card/резервные копии/игры/dark souls')
OF: str = ('/mnt/larka/games/steam/steamapps/compatdata/952060'
           '/pfx/drive_c/users/steamuser/AppData/Roaming/DarkSoulsIII/01100001020299c3/DS30000.sl2')

saves: dict[str, Path | str] = {}
saves['-'] = OF.replace('DS30000.sl2', 'DS30000-.sl2')
saves['братья'] = IF / 'братья/DS30000.sl2'
saves['виверна'] = IF / 'виверна/DS30000.sl2'
saves['гундир'] = IF / 'гундир/DS30000.sl2'
saves['демон'] = IF / 'демон/DS30000.sl2'
saves['демоны'] = IF / 'демоны/DS30000.sl2'
saves['дерево'] = IF / 'дерево/DS30000.sl2'
saves['доспехи'] = IF / 'доспехи/DS30000.sl2'
saves['душа пепла'] = IF / 'душа пепла/DS30000.sl2'
saves['дьяконы'] = IF / 'дьяконы/DS30000.sl2'
saves['йорм'] = IF / 'йорм/DS30000.sl2'
saves['король'] = IF / 'король/DS30000.sl2'
saves['маг'] = IF / 'маг/DS30000.sl2'
saves['мидир'] = IF / 'мидир/DS30000.sl2'
saves['новая'] = IF / 'новая/DS30000.sl2'
saves['олдрик'] = IF / 'олдрик/DS30000.sl2'
saves['оцейрос'] = IF / 'оцейрос/DS30000.sl2'
saves['понтифик'] = IF / 'понтифик/DS30000.sl2'
saves['скелет'] = IF / 'скелет/DS30000.sl2'
saves['старая'] = IF / 'DS30000.sl2'
saves['танцовщица'] = IF / 'танцовщица/DS30000.sl2'
saves['хранители бездны'] = IF / 'хранители бездны/DS30000.sl2'

r = run(['rofi', '-dmenu', '-matching', 'prefix'], capture_output=True, input='\n'.join(saves.keys()).encode('utf-8'))
k = r.stdout.decode('utf-8').rstrip()
if k in saves:
    args = ['install', '-pDvm644', str(saves[k]), OF]
    print(run(args))
else:
    print('empty')

sys.exit(0)
