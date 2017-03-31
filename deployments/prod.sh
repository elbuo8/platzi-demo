wget -O packer.zip https://releases.hashicorp.com/packer/0.12.3/packer_0.12.3_linux_amd64.zip?_ga=1.161515324.1027047904.1480563076
unzip packer.zip
./packer validate deployments/template.json
./packer build deployments/template.json
