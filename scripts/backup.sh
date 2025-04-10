#!/bin/bash
find '/mnt/xxx1/memory card' -type f -exec stat -c '%n %s %y' {} + > ~/tmp/hm6.txt
find '/mnt/xxx2/memory card' -type f -exec stat -c '%n %s %y' {} + >> ~/tmp/hm6.txt
sed -i 's/\/mnt\/xxx1\/memory card//' ~/tmp/hm6.txt
sed -i 's/\/mnt\/xxx2\/memory card//' ~/tmp/hm6.txt
sed -i 's/\/резервные копии\/Documents//' ~/tmp/hm6.txt
sed -i 's/\/резервные копии\/Pictures//' ~/tmp/hm6.txt
cat ~/tmp/hm6.txt | grep -v .git | sort -k 1 > ~/tmp/xxx.txt

find '/home/chaos/Documents' -type f -exec stat -c '%n %s %y' {} + > ~/tmp/hm6.txt
find '/home/chaos/Pictures' -type f -exec stat -c '%n %s %y' {} + >> ~/tmp/hm6.txt
find '/mnt/alisa/memory card' -type f -exec stat -c '%n %s %y' {} + >> ~/tmp/hm6.txt
sed -i 's/\/home\/chaos\/Documents//' ~/tmp/hm6.txt
sed -i 's/\/home\/chaos\/Pictures//' ~/tmp/hm6.txt
sed -i 's/\/mnt\/alisa\/memory card//' ~/tmp/hm6.txt
cat ~/tmp/hm6.txt | grep -v .git | grep -v velvet_db | grep -v venv | grep -v node_modules | grep -v __pycache__ | sort -k 1 > ~/tmp/alisa.txt
