npm install -g now
URL=$(now --docker -t $NOW_TOKEN)
echo "running acceptance test"
curl --silent -L $URL
