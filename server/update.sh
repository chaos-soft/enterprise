#!/bin/bash
ssh polina /bin/bash << EOF
    mkdir -p ~/python/{miranda,tools,velvet}
    systemctl restart ssh
EOF

scp -pr ~/Documents/enterprise/server polina:~/
scp -pr ~/Documents/python/miranda    polina:~/python/
scp -pr ~/Documents/python/tools      polina:~/python/
scp -pr ~/Documents/python/velvet     polina:~/python/
scp -pr ~/tmp/letsencrypt             polina:/etc/
