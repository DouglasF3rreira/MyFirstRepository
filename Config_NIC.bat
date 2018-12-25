@echo off

Set StrNicName="Ethernet"

echo Placa de rede %StrNicName%
echo 1 - Configurar um IP estatico
echo 2 - Ativar DHCP
echo ---------------------------------------------
Set /P UserChoice=Escolha 1 ou 2 baseado no menu acima:

If %UserChoice%==1 GoTo ConfigStaticIp
If %UserChoice%==2 GoTo ConfigDhcp
exit

:ConfigStaticIp
Set /P IppAddr=Digite o endereço IP:
Set /P NetworkMask=Digite a mascara de rede: 
netsh interface ipv4 set address name=%StrNicName% static %IppAddr% %NetworkMask%
Call :EndOfScript

:ConfigDhcp
netsh interface ipv4 set address name=%StrNicName% dhcp
Call :EndOfScript

:EndOfScript
echo Fim!
pause>nul
exit