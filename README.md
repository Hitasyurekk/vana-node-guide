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

~~~

/root/.cache/pypoetry/virtualenvs/chatgpt-3h7aoLAu-py3.11/bin/vanacli wallet export_private_key

~~~

**Ekranda ki gibi cold key'i anahtarını alın.**

![image](https://github.com/user-attachments/assets/45f22c1b-bdd8-41c1-935f-a1ca4ef00518)

**Şimdi aldığımız bu private keyi metamask'a import ediyoruz, daha sonra verdiğim ağ bilgilerini girerek metamask'a ağ ekliyoruz.**

**Network name: Satori Testnet**
**RPC URL: https://rpc.satori.vana.org**
**Chain ID: 14801**
**Currency: VANA**

**Faucet sitesine giderek test token talep ediyoruz. https://faucet.vana.org/moksha**

### DLP oluşturma!

~~~
./keygen.sh
~~~
**Burada bilgileri kendime göre doldurdum.**

![image](https://github.com/user-attachments/assets/01834ae6-9947-473e-8efd-791027f24ec6)

## 3. Adım artık token deploy ediyoruz! Burada hazır script buldum discord üzerinde bunun üzerinde token deploy edeceğiz.

```
cd $HOME

rm -rf vana-dlp-smart-contracts

git clone https://github.com/Josephtran102/vana-dlp-smart-contracts

cd vana-dlp-smart-contracts

npm install -g yarn

yarn --version

yarn install


```

*Çıktı böyle görünecektir*

![image](https://github.com/user-attachments/assets/aa1ff4e6-97a5-4d39-825e-137afae47fb8)


*Dosyaları indirdikten sonra bir dosyayı kopyalarak içeriğini değiştireceğiz.*


```
cp .env.example .env

nano .env
```

Kendi cüzdan bilgilerinizi burada giriceksiniz ve token bilgisi ekleyeceksinn İşlem bittikten sonra ctrl x + y + enter ile çıkış yapabilirsiniz.
![image](https://github.com/user-attachments/assets/48c5279e-8328-46c7-86aa-c2e6c483f031)

*Contrat deploy adımı* 
```
npx hardhat deploy --network moksha --tags DLPDeploy

```

*Burada ca adreslerinizi kopyalamayı unutmayın*

![image](https://github.com/user-attachments/assets/c71ac3d4-6996-421d-b4d3-7b97dfa84eb3)

## Şimdi tekrar güncellemeler yapacağız.

```
nano ~/vana-dlp-chatgpt/.env

```

*Şimdi buradaki bilgileri kendinize göre girmeniz gerekiyor.*

```
# The network to use, currently Vana Moksha testnet
OD_CHAIN_NETWORK=moksha
OD_CHAIN_NETWORK_ENDPOINT=https://rpc.moksha.vana.org

# Optional: OpenAI API key for additional data quality check
OPENAI_API_KEY="sk-aIKhy1wmK6Vfx.............._CIJvZx7uZl2HjAA"

# Optional: Your own DLP smart contract address once deployed to the network, useful for local testing

DLP_MOKSHA_CONTRACT=0x657.......6625b
# Optional: Your own DLP token contract address once deployed to the network, useful for local testing

DLP_TOKEN_MOKSHA_CONTRACT=0x73eB7..........304C

# The private key for the DLP, follow "Generate validator encryption keys" section in the README
PRIVATE_FILE_ENCRYPTION_PUBLIC_KEY_BASE64="LS0tLS1CRUdJTiB..........g=="
```

*Opsiyonel kısımları doldurmadan geçebilirsiniz. bu komut ile cat /root/vana-dlp-chatgpt/public_key_base64.asc private key kısmına yazacağınız şeyi bulabilirsiniz daha sonra ctrl x y enter ile çıkın*
-

## Validator kurulumu

```
cd ~
cd vana-dlp-chatgpt
```

*Bu adımdan sonra cold walletınıza oluşturduğunuz tokeni import edin ve hot wallet'a gönderin ben 1000 adet gönderdim*

![image](https://github.com/user-attachments/assets/e27827e5-6756-429e-8537-6a572cb7230d)

*Şimdi validtor kaydedeceğiz*
```
./vanacli dlp register_validator --stake_amount 10
```
*Burada cüzdan şifrenizi giriceksiniz cüzdan oluştururken girdiğiniz şifreyi girin*

![image](https://github.com/user-attachments/assets/08cf2c9c-71ee-4428-95a0-0ba6fa72aabd)

*Şimdi hotkey ile çalıştırma yapacağız*

./vanacli dlp approve_validator --validator_address=hotkey wwallet adresiniz

![image](https://github.com/user-attachments/assets/bf491512-5090-4c8e-bc7b-a3b06799a20e)



