#!/bin/bash
ssh polina "find '/root/python/velvet' -type f -exec stat -c '%n %s %y' {} +" > ~/tmp/hm6.txt
sed -i 's/\/root\/python\/velvet//' ~/tmp/hm6.txt
cat ~/tmp/hm6.txt | grep -v .git | sort -k 1 > ~/tmp/server.txt

find '/home/chaos/Documents/python/velvet' -type f -exec stat -c '%n %s %y' {} + > ~/tmp/hm6.txt
sed -i 's/\/home\/chaos\/Documents\/python\/velvet//' ~/tmp/hm6.txt
cat ~/tmp/hm6.txt | grep -v .git | grep -v __pycache__ | sort -k 1 > ~/tmp/velvet.txt
