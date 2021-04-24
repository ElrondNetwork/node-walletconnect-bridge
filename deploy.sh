if test "$1" != "" ; then
  git checkout "$1"
fi
git pull origin "$1"

npm install
npm run build

pm2 delete walletconnect-bridge
pm2 start node --name walletconnect-bridge -- ./build --no-daemon