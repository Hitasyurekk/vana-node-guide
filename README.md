# vana-node-guide
Withvana Node Guide

Merhaba arkadaşlar bu Guide withvana Testnet görevlerini anlatmaktadır. 

Videolu rehber : 


## With vana nedir ?


------------------------------------------------------------------------------





# Node Kurulumuna Giriş

**Öncelikle kodları olabildiğince sadeleştirmeye çalıştım bazı kodları tek script haline getirdim bazılarını ayrı ayrı anlatımı kolaylaştırmak için birleştirmedim.**

#### Gerekli uygulamaları yükleyelim.

~~~
sudo apt update

sudo apt install software-properties-common

sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.11 python3.11-venv python3.11-dev
~~~


## Poetry kurulumu 
~~~
curl -sSL https://install.python-poetry.org | python3 -

echo 'export PATH="$HOME/.local/bin:$PATH"' >> $HOME/.bash_profile
source $HOME/.bash_profile
poetry --version

~~~

**Çıktı böyle olmalı**
![image](https://github.com/user-attachments/assets/6d5ca1e6-c1cc-46e3-9464-1a1ba62c2dd9)


## NVM Paketlerini yükleme 

~~~
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

echo 'export NVM_DIR="$HOME/.nvm"' >> $HOME/.bash_profile
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm' >> $HOME/.bash_profile
echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' >> $HOME/.bash_profile

source $HOME/.bash_profile

nvm install --lts
~~~

**Çıktı böyle olacaktır**
![image](https://github.com/user-attachments/assets/51222fba-8f52-49ae-bd1f-0e2b703859e4)

## VANA Dlp kurulumu

~~~
apt install git

git clone https://github.com/vana-com/vana-dlp-chatgpt.git
cd vana-dlp-chatgpt
~~~

*Çıktı böyle olmalı*
![image](https://github.com/user-attachments/assets/b7476f12-9737-413e-adb9-b1f09cf14537)

**Diğer gereksinimler**

~~~
poetry install

~~~

*Çıktı yine böyle olacaktır*
![image](https://github.com/user-attachments/assets/745c3991-1dcb-442d-a199-195114b75722)


## Vana Cli kurulumu
~~~
apt install python3-pip

pip install vana
~~~

*Çıktı yine böyle olacaktır*
![image](https://github.com/user-attachments/assets/71c95763-d542-4f96-9fbc-c8fd514422ff)


### Cüzdan oluşturma

**Burada işlemlerimizi tamamlamak için cüzdan oluşturacağız.**


<code>/root/.cache/pypoetry/virtualenvs/chatgpt-3h7aoLAu-py3.11/bin/vanacli wallet create --wallet.name default --wallet.hotkey default</code>

Bu kelimeleri kaydedin ihtiyacımız olacak cold key ve hot key alacaksınız ayrıca bir şifre girmeniz gerekiyor.

![image](https://github.com/user-attachments/assets/e3170628-8c1d-4ac0-9e1e-77366ec7262e)

**Şimdi cüzdanlarımızın private keyini alarak dışarıya aktaracağız.**

<code>/root/.cache/pypoetry/virtualenvs/chatgpt-3h7aoLAu-py3.11/bin/vanacli wallet export_private_key</code>

**Ekranda ki gibi cold key'i anahtarını alın.**

![image](https://github.com/user-attachments/assets/45f22c1b-bdd8-41c1-935f-a1ca4ef00518)

**Şimdi aldığımız bu private keyi metamask'a import ediyoruz, daha sonra verdiğim ağ bilgilerini girerek metamask'a ağ ekliyoruz.**

**Network name: Satori Testnet**
**RPC URL: https://rpc.satori.vana.org**
**Chain ID: 14801**
**Currency: VANA**

**Faucet sitesine giderek test token talep ediyoruz. https://faucet.vana.org/satori**

### DLP oluşturma!

<code> cd /root/vana-node-guide/necessary-applications/vana-dlp-chatgpt/
./keygen.sh </code>

**Burada bilgileri kendime göre doldurdum.**

![image](https://github.com/user-attachments/assets/630a4dd8-4628-4685-b04d-e5e02f209c3d)

## 3. Adım artık token deploy ediyoruz!

```
cd $HOME

git clone https://github.com/vana-com/vana-dlp-smart-contracts.git

cd vana-dlp-smart-contracts

npm install -g yarn

yarn --version

yarn install
```

**Dosyaları indirdikten sonra bis dosyayı kopyalarak içeriğini değiştireceğiz.**


```
cp .env.example .env

nano .env
```

Kendi cüzdan bilgilerinizi burada giriceksiniz ve token bilgisi ekleyeceksinn İşlem bittikten sonra ctrl x + y + enter ile çıkış yapabilirsiniz.
![image](https://github.com/user-attachments/assets/48c5279e-8328-46c7-86aa-c2e6c483f031)

Contrat deploy adımı 
```
npx hardhat deploy --network satori --tags DLPDeploy
```


