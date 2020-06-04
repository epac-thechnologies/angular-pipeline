export PATH=/sbin:/usr/sbin:/usr/bin:/usr/local/bin
pwd
npm cache clean --force
npm config set unsafe-perm true
npm install
ng build --prod
docker build -t angular-pipeline .