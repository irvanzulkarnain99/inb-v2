#!/bin/bash
## buat NPM
export NVM_DIR="$HOME/.nvm" # export NVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
## buat change owner sama grub
sudo chown ec2-user -R /var/www/html/heliosbackend ## buat change owner
sudo chgrp www -R /var/www/html/heliosbackend ## buat change grub
## cd ( change directory )
cd /var/www/html/heliosbackend ## change directory ke tempat terkait
## buat install npm
npm install ## install npm
npm install -g pm2 ## install pm2
## build sebelum run
npm install && npm run inbound-api:build ## buat build
## stop dan star
/home/ec2-user/.nvm/versions/node/v16.3.0/bin/pm2 stop dist/apps/inbound-api/main.js --name inbound-api ## stop pm2
/home/ec2-user/.nvm/versions/node/v16.3.0/bin/pm2 start dist/apps/inbound-api/main.js --name inbound-api ## start pm2
/home/ec2-user/.nvm/versions/node/v16.3.0/bin/pm2 restart dist/apps/inbound-api/main.js --name inbound-api ## restart pm2
