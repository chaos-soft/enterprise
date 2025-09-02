#!/bin/bash
cd ~/Documents/python/miranda-react
./build_static.sh
ssh polina 'rm -r ~/python/velvet/store/miranda'
scp -pr dist/* polina:~/python/velvet/store/miranda
