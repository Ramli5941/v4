#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
clear
# Getting

sldomain=$(cat /root/nsdomain)
cdndomain=$(cat /root/awscdndomain)
slkey=$(cat /etc/slowdns/server.pub)
TIMES="10"
CHATID=$(cat /etc/id)
KEY=$(cat /etc/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"

clear


domen=`cat /etc/xray/domain`

portsshws=`cat ~/log-install.txt | grep -w "SSH Websocket" | cut -d: -f2 | awk '{print $1}'`
wsssl=`cat /root/log-install.txt | grep -w "SSH SSL Websocket" | cut -d: -f2 | awk '{print $1}'`
#     Create account 
        hijau="\e[1;32m"
        NC="\033m"
        #Color validation 
          hijau="\e[1;32m"
          cyan="\e[1;36m"
          kuning="\e[1;33m"
          ungu="\e[1;35m"
          putih="\e[1;37m"
          white="\e[1;37m"
          NC="\033[0m"
          # CREATE S S H 
green_background="\033[42;37m"
red_background="\033[41;37m"
clear
echo -e "\033[1;93m☉————————————————————————☉\033[0m"
echo -e " SSH Ovpn Account           "
echo -e "\033[1;93m☉————————————————————————☉\033[0m"
read -p " Username : " Login
read -p " Password : " Pass
read -p " Limit IP     : " iplimit
read -p " Limit Quota : " Quota
read -p " Expired (Days) : " masaaktif
limitip
if [[ $iplimit -gt 0 ]]; then
mkdir -p /etc/kyt/limit/ssh/ip
echo -e "$iplimit" > /etc/kyt/limit/ssh/ip/$Login
else
echo > /dev/null
fi
clear
clear
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
expi="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`

if [ ! -e /etc/ssh ]; then
  mkdir -p /etc/ssh
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/ssh/${Login}
fi
DATADB=$(cat /etc/ssh/.ssh.db | grep "^#ssh#" | grep -w "${Login}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${Login}\b/d" /etc/ssh/.ssh.db
fi
echo "#ssh# ${Login} ${Pass} ${Quota} ${iplimit} ${expe}" >>/etc/ssh/.ssh.db
clear

cat > /var/www/html/ssh-$Login.txt <<-END
◇━━━━━━━━━━━━━━━━━◇
Format SSH OVPN Account
◇━━━━━━━━━━━━━━━━━◇
Username         : $Login
Password         : $Pass
◇━━━━━━━━━━━━━━━━━◇
IP               : $IP
Host             : $domain
Port OpenSSH     : 443, 80, 22
Port Dropbear    : 443, 109
Port Dropbear WS : 443, 109
Port SSH UDP     : 1-65535
Port SSH WS      : 80, 8080, 8081-9999
Port SSH SSL WS  : 443
Port SSL/TLS     : 400-900
Port OVPN WS SSL : 443
Port OVPN SSL    : 443
Port OVPN TCP    : 1194
Port OVPN UDP    : 2200
BadVPN UDP       : 7100, 7300, 7300
◇━━━━━━━━━━━━━━━━━◇
Aktif Selama     : $masaaktif Hari
Dibuat Pada      : $tnggl
Berakhir Pada    : $expe
◇━━━━━━━━━━━━━━━━━◇
Payload WSS: GET wss://BUG.COM/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf] 
◇━━━━━━━━━━━━━━━━━◇
OVPN Download : https://$domain:81/
◇━━━━━━━━━━━━━━━━━◇

END

CHATID="$CHATID"
KEY="$KEY"
TIME="$TIME"
URL="$URL"
TEXT="
<code>☉————————————————————————☉</code>
<code>🍀Succes Cretae SSH Account🍀     </code>
<code>☉————————————————————————☉</code>
<code> "${z}${r} ${NC}${z}CITY          ${NC}: $CITY"</code>
<code> "${z}${r} ${NC}${z}ISP           ${NC}: $ISP"
<code>☉————————————————————————☉</code>
<code>Username         : </code> <code>$Login</code>
<code>Password         : </code> <code>$Pass</code>
<code>Limit Quota       ; </code> <code>$Quota</code>
<code>☉————————————————————————☉</code>
<code>IP               : $IP</code>
<code>Host             : </code> <code>$domain</code>
<code>Port OpenSSH     : 443, 80, 22</code>
<code>Port Dropbear    : 443, 109</code>
<code>Port SSH WS      : 80, 8080, 8081-9999 </code>
<code>Port SSH UDP     : 1-65535 </code>
<code>Port SSH SSL WS  : 443</code>
<code>Port SSL/TLS     : 400-900</code>
<code>Port OVPN WS SSL : 443</code>
<code>Port OVPN SSL    : 443</code>
<code>Port OVPN TCP    : 443, 1194</code>
<code>Port OVPN UDP    : 2200</code>
<code>BadVPN UDP       : 7100, 7300, 7300</code>
<code>☉————————————————————————☉</code>
<code>Payload WS       : </code><code>GET / HTTP/1.1[crlf]Host: [host][crlf]Connection: Upgrade[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]</code>
<code>☉————————————————————————☉</code>
<code>Payload WSS      : </code><code>GET wss://BUG.COM/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]</code>
<code>☉————————————————————————☉</code>
OVPN Download : https://$domain:81/
<code>☉————————————————————————☉</code>
<code>Save Link Account: </code>https://$domain:81/ssh-$Login.txt
<code>☉————————————————————————☉</code>
Aktif Selama         : $masaaktif Hari
Dibuat Pada          : $tnggl
Berakhir Pada        : $expe
<code>☉————————————————————————☉</code>
"

curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
echo ""
echo -e "\033[1;93m☉————————————————————————☉\033[0m" | tee -a /etc/user-create/user.log
echo -e "🧿Status Create SSH Succes🧿   " | tee -a /etc/user-create/user.log
echo -e "\033[1;93m☉————————————————————————☉\033[0m" | tee -a /etc/user-create/user.log
echo -e "${z}${r} ${NC}${z}CITY           ${NC}: $CITY" | tee -a /etc/user-create/user.log
echo -e "${z}${r} ${NC}${z}ISP            ${NC}: $ISP" | tee -a /etc/user-create/user.log
echo -e "\033[1;93m☉————————————————————————☉\033[0m" | tee -a /etc/user-create/user.log
echo -e "Host             : $domain" | tee -a /etc/user-create/user.log
echo -e "IP               : $IP" | tee -a /etc/user-create/user.log
echo -e "Username         : $Login" | tee -a /etc/user-create/user.log
echo -e "Password         : $Pass" | tee -a /etc/user-create/user.log
echo -e "\033[1;93m☉————————————————————————☉\033[0m" | tee -a /etc/user-
echo -e "Limit Quota      : $Quota GB" | tee -a /etc/user-create/user.log
echo -e "Limit Ip         : ${iplimit} User" | tee -a /etc/user-create/user.log
echo -e "\033[1;93m☉————————————————————————☉\033[0m" | tee -a /etc/user-
echo -e "NS               : $sldomain" | tee -a /etc/log-create-user.log
echo -e "\033[1;93m☉————————————————————————☉\033[0m" | tee -a /etc/user-
echo -e "PubKey           : $slkey" | tee -a /etc/log-create-user.log
echo -e "\033[1;93m☉————————————————————————☉\033[0m" | tee -a /etc/user-
#echo -e "Location         : $CITY" | tee -a /etc/user-create/user.log
echo -e "Port OpenSSH     : 443, 80, 22" | tee -a /etc/user-create/user.log
#echo -e "Port DNS         : 443, 53 ,22 " | tee -a /etc/user-create/user.log
echo -e "Port SSH UDP     : 1-65535" | tee -a /etc/user-create/user.log
echo -e "Port Dropbear    : 443, 109" | tee -a /etc/user-create/user.log
echo -e "Port SSH WS      : 80, 8080, 8880, 2082" | tee -a /etc/user-create/user.log
echo -e "Port SSH SSL WS  : 443" | tee -a /etc/user-create/user.log
echo -e "Port SSL/TLS     : 400-900" | tee -a /etc/user-create/user.log
echo -e "Port OVPN WS SSL : 443" | tee -a /etc/user-create/user.log
echo -e "Port OVPN SSL    : 443" | tee -a /etc/user-create/user.log
echo -e "Port OVPN TCP    : 443, 1194" | tee -a /etc/user-create/user.log
echo -e "Port OVPN UDP    : 2200" | tee -a /etc/user-create/user.log
echo -e "BadVPN UDP       : 7100, 7300, 7300" | tee -a /etc/user-create/user.log
echo -e "\033[1;93m☉————————————————————————☉\033[0m" | tee -a /etc/user-create/user.log
echo -e "Payload WS       : GET / HTTP/1.1[crlf]Host: [host][crlf]Connection: Upgrade[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]" | tee -a /etc/user-create/user.log
echo -e "\033[1;93m☉————————————————————————☉\033[0m" | tee -a /etc/user-create/user.log
echo -e "Payload WSS      : GET wss://BUG.COM/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]" | tee -a /etc/user-create/user.log
echo -e "\033[1;93m☉————————————————————————☉\033[0m" | tee -a /etc/user-create/user.log
echo -e "OVPN Download    : https://$domain:81/" | tee -a /etc/user-create/user.log
echo -e "\033[1;93m☉————————————————————————☉\033[0m" | tee -a /etc/user-create/user.log
echo -e "Save Link Account: https://$domain:81/ssh-$Login.txt" | tee -a /etc/user-create/user.log
echo -e "\033[1;93m☉————————————————————————☉\033[0m" | tee -a /etc/user-create/user.log
echo -e "Aktif Selama     : $masaaktif Hari" | tee -a /etc/user-create/user.log
echo -e "Dibuat Pada      : $tnggl" | tee -a /etc/user-create/user.log
echo -e "Berakhir Pada    : $expe" | tee -a /etc/user-create/user.log
echo -e "\033[1;93m☉————————————————————————☉\033[0m" | tee -a /etc/user-create/user.log
echo "" | tee -a /etc/user-create/user.log
read -p "Enter Back To Menu"
menu
