domain=$(cat /etc/xray/domain)
TIMES="10"
CHATID=$(cat /etc/id)
KEY=$(cat /etc/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"

tls="$(cat ~/log-install.txt | grep -w "Vless TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vless None TLS" | cut -d: -f2|sed 's/ //g')"
user=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
uuid=$(cat /proc/sys/kernel/random/uuid)
masaaktif=1
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
sed -i '/#vless$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
export vlesslink1="vless://${uuid}@${sts}${domain}:443?path=/vless&security=tls&encryption=none&type=ws&sni=$sni#${user}"
export vlesslink2="vless://${uuid}@${sts}${domain}:80?path=/vless&encryption=none&host=$sni&type=ws#${user}"
export vlesslink3="vless://${uuid}@api.useinsider.com:80?path=/vless&encryption=none&host=${sts}${domain}&type=ws#DIGI-APN-${user}"
export vlesslink4="vless://${uuid}@162.159.134.61:80?path=/vless&encryption=none&host=${sts}${domain}&type=ws#DIGI-BOSSTER-${user}"
export vlesslink5="vless://${uuid}@${domain}:80?path=/vless&encryption=none&host=m.pubgmobile.com&type=ws#UMOBILE-FUNZ-${user}"
export vlesslink6="vless://${uuid}@104.17.113.188:80?path=/vless&encryption=none&host=eurohealthobservatory.who.int.${domain}&type=ws#YES-${user}"
export vlesslink7="vless://${uuid}@104.17.148.22:80?path=/vless&encryption=none&host=www.speedtest.net.${domain}&type=ws#SELCOM-0BASIC-${user}"
export vlesslink8="vless://${uuid}@104.17.10.12:80?path=/vless&encryption=none&host=cdn.who.int.${domain}&type=ws#UNIFI-${user}"
systemctl restart xray
clear
vless1="$(echo $vlesslink1 | base64 -w 0)"
vless2="$(echo $vlesslink2 | base64 -w 0)"
vless3="$(echo $vlesslink3 | base64 -w 0)"

TEXT="
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>  Premium Vless Account</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Remarks      : </code> <code>${user}</code>
<code>Domain       : </code> <code>${domain}</code>
<code>Port TLS     : 443</code>
<code>Port NTLS    : 80, 8080</code>
<code>Port GRPC    : 443</code>
<code>User ID      : </code> <code>${uuid}</code>
<code>AlterId      : 0</code>
<code>Security     : auto</code>
<code>Network      : WS or gRPC</code>
<code>Path vless   : </code> <code>/vless</code>
<code>ServiceName  : </code> <code>/vless-grpc</code>
<code>Expired On : </code> <code>$timer Minutes</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Link TLS     :</code> 
<code>${vless1}</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Link NTLS    :</code> 
<code>${vless2}</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Link GRPC    :</code> 
<code>${vless3}</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
"

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null

echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[40;1;37m        Trial Xray/Vless        \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "port TLS       : $tls"
echo -e "port none TLS  : $none"
echo -e "id             : ${uuid}"
echo -e "Encryption     : none"
echo -e "Network        : ws"
echo -e "Path           : /vless"
echo -e "Path           : vless-grpc"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Link TLS       : ${vlesslink1}" | tee -a /etc/log-create-user.log
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Link none TLS  : ${vlesslink2}" | tee -a /etc/log-create-user.log
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Link DIGI APN     : ${vlesslink3}" | tee -a /etc/log-create-user.log
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Link DIGI-BOSSTER : ${vlesslink4}" | tee -a /etc/log-create-user.log
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Link UMOBILE-FUNZ : ${vlesslink5}" | tee -a /etc/log-create-user.log
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Link YES          : ${vlesslink6}" | tee -a /etc/log-create-user.log
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Link SELCOM-0BASIC: ${vlesslink7}" | tee -a /etc/log-create-user.log
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Link UNIFI        : ${vlesslink8}" | tee -a /etc/log-create-user.log
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "\e[33m name      : ${user}" | tee -a /etc/log-create-user.log
echo -e "\e[33mExpired On : $exp" | tee -a /etc/log-create-user.log
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo ""

read -n 1 -s -r -p "Press any key to back on menu"

menu