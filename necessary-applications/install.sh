#!/bin/bash

echo -e "\n###############################"
echo "# The guide was prepared by Hitasyurek."
echo "###############################\n"

echo "Tw / X : https://x.com/hitasyurek"
echo "TG : https://t.me/ROVEtm\n"

# Kurulum öncesi güncellemeleri yap
echo "Güncellemeler yapılıyor..."
sudo apt update

# 1.1 Gerekli bağımlılıkları yükleyin
echo "Gerekli bağımlılıklar yükleniyor..."

# Git ve curl yükleyin
sudo apt install -y software-properties-common git curl

# Python ve gerekli paketlerini yükleyin
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install -y python3.11 python3.11-venv python3.11-dev

# Poetry yükleyin
curl -sSL https://install.python-poetry.org | python3 -
echo 'export PATH="$HOME/.local/bin:$PATH"' >> $HOME/.bash_profile
source $HOME/.bash_profile
poetry --version

# NPM ve Node.js yükleyin
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
echo 'export NVM_DIR="$HOME/.nvm"' >> $HOME/.bash_profile
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # Bu NVM'i yükler' >> $HOME/.bash_profile
echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # Bu NVM bash tamamlama yükler' >> $HOME/.bash_profile
source $HOME/.bash_profile
nvm install --lts
node -v
npm -v

# 1.2 Vana-dlp-chatgpt'yi yükleyin
echo "Vana-dlp-chatgpt yükleniyor..."
git clone https://github.com/vana-com/vana-dlp-chatgpt.git
cd vana-dlp-chatgpt || exit

# Python bağımlılıklarını yükleyin
poetry install

# 1.3 Vana CLI'yi yükleyin
echo "Vana CLI yükleniyor..."
pip install vana

echo "Kurulum tamamlandı!"
