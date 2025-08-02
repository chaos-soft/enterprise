#!/bin/bash
xdg-open ~/Documents/python/velvet/store/html/articles/57.html
read -n 1 -p 'Waiting...'

scp -pr ~/Documents/python/miranda/config.ini                 polina:~/python/miranda/
scp -pr ~/Documents/python/velvet/nginx/nginx.conf            polina:~/python/velvet/nginx/
scp -pr ~/Documents/python/velvet/store/html/articles/57.html polina:~/python/velvet/store/html/articles/
