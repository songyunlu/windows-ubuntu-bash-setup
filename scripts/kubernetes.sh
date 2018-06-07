#!/usr/bin/env bash

# kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/v${KUBERNETES_VERSION}/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version
source <(kubectl completion zsh)
echo 'alias kc="kubectl"' >> ~/.zshrc

# kube-shell
pip install kube-shell

# kubectx
git clone https://github.com/ahmetb/kubectx.git "${HOME}/.kubectx"
sudo ln -s ${HOME}/.kubectx/kubectx /usr/local/bin/kubectx
echo 'alias kctx="kubectx"' >> ~/.zshrc

# kubens
sudo ln -s ${HOME}/.kubectx/kubens /usr/local/bin/kubens
sudo chmod a+x /usr/local/bin/kubectx /usr/local/bin/kubens
echo 'alias kns="kubens"' >> ~/.zshrc

# kube-ps1
git clone https://github.com/jonmosco/kube-ps1.git ~/.kube-ps1
echo 'source $HOME/.kube-ps1/kube-ps1.sh' >> ~/.zshrc
echo 'PROMPT='$(kube_ps1)'$PROMPT' >> ~/.zshrc
