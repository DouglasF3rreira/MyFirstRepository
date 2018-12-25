@echo off

Set StrNicName="VirtualBox"
Set NetworkAddr=192.168.1
Set NetworkMask=255.255.255.0
Set IPsArrayZSL=(43,37,36,42,34,40,35,38,41,44,19,30,21,24,6,7,9,11,16,61,71,10,12,17,18,31,32,14,23,26,22,28,25,29)
Set IPsArray=%IPsArrayZSL%

echo Placa de rede %StrNicName%
echo 1 - Configurar o array de IPs estaticos
echo 2 - Ativar DHCP (resetar IPs estaticos)
echo ---------------------------------------------
Set /P UserChoice=Escolha 1 ou 2 baseado no menu acima:

If %UserChoice%==1 GoTo ConfigStaticIp
If %UserChoice%==2 GoTo ConfigDhcp

:ConfigStaticIp
For %%j in %IPsArray% Do netsh interface ipv4 add address %StrNicName% %NetworkAddr%.%%j %NetworkMask%
Call :EndOfScript

:ConfigDhcp
netsh interface ipv4 set address name=%StrNicName% dhcp
Call :EndOfScript

:EndOfScript
cls
echo Fim!
pause>nul
exit
