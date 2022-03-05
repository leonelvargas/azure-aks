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
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
#Kubectl CLI
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
b="deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main"
echo $b | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update -y
sudo apt install -y kubectl

