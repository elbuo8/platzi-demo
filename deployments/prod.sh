wget -O /tmp/packer.zip https://releases.hashicorp.com/packer/0.12.3/packer_0.12.3_linux_amd64.zip?_ga=1.161515324.1027047904.1480563076
wget -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/0.9.2/terraform_0.9.2_linux_amd64.zip?_ga=1.82888214.1607963592.1469458467
unzip /tmp/packer.zip -d ~/bin
unzip /tmp/terraform.zip -d ~/bin
packer validate deployments/template.json &&
packer build deployments/template.json &&
export TF_VAR_image_id=$(curl -H "Authorization: Bearer $DIGITALOCEAN_API_TOKEN" https://api.digitalocean.com/v2/images?private=true | jq ."images[] | select(.name == \"platzi-demo-$CIRCLE_BUILD_NUM\") | .id")
echo $TF_VAR_image_id
cd infra && terraform apply && cd .. &&
git add infra && git commit -m "Deployed $CIRCLE_BUILD_NUM [skip ci]" &&
git push origin master
