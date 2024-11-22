subl4 ~/Documents/python/miranda/config.ini ~/Documents/python/velvet/store/html/articles/57.html
read -n 1 -p 'Waiting...'
scp -pr ~/Documents/python/miranda/config.ini polina:/root/python/miranda/
scp -pr ~/Documents/python/miranda/twitch.json polina:/root/python/miranda/
scp -pr ~/Documents/python/velvet/store/html/articles/57.html polina:/root/python/velvet/store/html/articles/
