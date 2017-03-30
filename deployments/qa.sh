npm install -g now
echo "deploying..."
URL=$(now --docker -t $NOW_TOKEN)
echo "running acceptance on $URL"
curl --silent -L $URL
