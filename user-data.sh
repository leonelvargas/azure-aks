#!/bin/bash
sudo apt update -y
sudo pt upgrade -y
#Helm CLI
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
#Argo CD
wget https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo mv argocd* /usr/local/bin/argocd
sudo chmod +x /usr/local/bin/argocd
#Utils
sudo apt install -y net-tools acl unzip
#Create the Pyplan folder and give access to the current user.
sudo mkdir -p /pyplan/deploy && sudo setfacl -R -m u:pyplan:rwx,d:u:pyplan:rwx /pyplan
#Azure CLI
sudo apt install ca-certificates curl apt-transport-https lsb-release gnupg -y
curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
AZ_REPO=$(lsb_release -cs)
a="deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main"
echo $a | sudo tee /etc/apt/sources.list.d/azure-cli.list
sudo apt update -y
sudo apt install azure-cli
#Kubectl CLI
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
b="deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main"
echo $b | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update -y
sudo apt install -y kubectl

