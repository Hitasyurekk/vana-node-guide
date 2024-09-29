# vana-node-guide
Withvana Node Guide

Merhaba arkadaşlar bu Guide withvana Testnet görevlerini anlatmaktadır. 

Videolu rehber : 


## With vana nedir ?


------------------------------------------------------------------------------





# Node Kurulumuna Giriş

Öncelikle kodları olabildiğince sadeleştirmeye çalıştım bazı kodları tek script haline getirdim bazılarını ayrı ayrı anlatımı kolaylaştırmak için birleştirmedim.

#### Gerekli uygulamaları yükleyelim.

~~~
sudo apt update && sudo apt install -y git && git clone https://github.com/Hitasyurekk/vana-node-guide.git && cd vana-node-guide/necessary-applications && chmod +x install.sh && ./install.sh
~~~

**Bu ekran geldiğinde ilk adım tamamlanmıştır.**
![image](https://github.com/user-attachments/assets/f786ea95-407a-4fad-a1b0-cc17041f447c)


### Cüzdan oluşturma

**Burada işlemlerimizi tamamlamak için cüzdan oluşturacağız.**

<code>
vana cli wallet create --wallet.name default --wallet.hotkey default
</code>

Bu kelimeleri kaydedin ihtiyacımız olacak cold key ve hot key alacaksınız ayrıca bir şifre girmeniz gerekiyor.
![image](https://github.com/user-attachments/assets/b1184e12-8f68-4048-b9f0-e3d1703f0c5d)

**Şimdi cüzdanlarımızın private keyini alarak dışarıya aktaracağız.**

vanacli wallet export_private_key

**Ekranda ki gibi sırasıyla 2 anahtarı alın.**
![image](https://github.com/user-attachments/assets/dc1fa655-3e7b-465e-8d7b-38a9d2595d62)

**Şimdi aldığımız bu private keyleri metamask'a import ediyoruz, daha sonra verdiğim ağ bilgilerini girerek metamask'a ağ ekliyoruz.**

**Network name: Satori Testnet**
**RPC URL: https://rpc.satori.vana.org**
**Chain ID: 14801**
**Currency: VANA**

**Faucet sitesine giderek test token talep ediyoruz. https://faucet.vana.org/satori**
