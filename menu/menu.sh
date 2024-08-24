#!/bin/bash
ipsaya=$(curl -sS ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/Ramli5941/permission/main/ipmini"
checking_sc() {
    useexp=$(curl -sS $data_ip | grep $ipsaya | awk '{print $3}')
    if [[ $date_list < $useexp ]]; then
        echo -ne
    else
        echo -e "\033[1;36m┌─────────────────────────────────────────────────┐\033[0m"
        echo -e "\033[1;36m \033[0m ${COLBG1}          ${WH}• AUTOSCRIPT PREMIUM •               \033[0m \033[1;36m $NC"
        echo -e "\033[1;36m└─────────────────────────────────────────────────┘\033[0m"
        echo -e "\033[1;36m┌─────────────────────────────────────────────────┐\033[0m"
        echo -e "            ${RED}PERMISSION DENIED !\033[0m"
        echo -e "   \033[0;33mYour VPS\033[0m $ipsaya \033[0;33mHas been Banned\033[0m"
        echo -e "     \033[0;33mBuy access permissions for scripts\033[0m"
        echo -e "             \033[0;33mContact Your Admin \033[0m"
        echo -e "             \033[0;33mTelegram owner: https://t.me/SoporMan6838"
        echo -e "\033[1;36m└─────────────────────────────────────────────────┘\033[0m"
        exit
    fi
}
checking_sc
Name=$(curl -sS https://raw.githubusercontent.com/Ramli5941/permission/main/ipmini | grep $ipsaya | awk '{print $2}')
# =========================================
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/2
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"

trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let tra=$trx/2
ssx=$(grep -c -E "^## " "/etc/xray/config.json")
let ssa=$ssx/2

if [[ -e /usr/bin/bot ]]; then
echo -ne
else
wget -O /usr/bin/bot https://raw.githubusercontent.com/Ramli5941/v4/main/bot.sh && chmod +x /usr/bin/bot
fi
UDPX="https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2"
# // Exporting Language to UTF-8
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'
#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
clear

# // Exporting Language to UTF-8

export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'


# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"

# TIME ZON
WKT=$(curl -s ipinfo.io/timezone )

clear
clear && clear && clear
clear;clear;clear
cek=$(service ssh status | grep active | cut -d ' ' -f5)
if [ "$cek" = "active" ]; then
stat=-f5
else
stat=-f7
fi
ssh=$(service ssh status | grep active | cut -d ' ' $stat)
if [ "$ssh" = "active" ]; then
ressh="${green}ON${NC}"
else
ressh="${red}OFF${NC}"
fi
sshstunel=$(service stunnel4 status | grep active | cut -d ' ' $stat)
if [ "$sshstunel" = "active" ]; then
resst="${green}ON${NC}"
else
resst="${red}OFF${NC}"
fi
sshws=$(service ws-stunnel status | grep active | cut -d ' ' $stat)
if [ "$sshws" = "active" ]; then
ressshws="${green}ON${NC}"
else
ressshws="${red}OFF${NC}"
fi
ngx=$(service nginx status | grep active | cut -d ' ' $stat)
if [ "$ngx" = "active" ]; then
resngx="${green}ON${NC}"
else
resngx="${red}OFF${NC}"
fi
dbr=$(service dropbear status | grep active | cut -d ' ' $stat)
if [ "$dbr" = "active" ]; then
resdbr="${green}ON${NC}"
else
resdbr="${red}OFF${NC}"
fi
v2r=$(service xray status | grep active | cut -d ' ' $stat)
if [ "$v2r" = "active" ]; then
resv2r="${green}ON${NC}"
else
resv2r="${red}OFF${NC}"
fi
function addhost(){
clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -rp "Domain/Host: " -e host
echo ""
if [ -z $host ]; then
echo "????"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
setting-menu
else
echo "IP=$host" > /var/lib/scrz-prem/ipvps.conf
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "Dont forget to renew cert"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
fi
}
function genssl(){
clear
systemctl stop nginx
domain=$(cat /var/lib/scrz-prem/ipvps.conf | cut -d'=' -f2)
Cek=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
if [[ ! -z "$Cek" ]]; then
sleep 1
echo -e "[ ${red}WARNING${NC} ] Detected port 80 used by $Cek " 
systemctl stop $Cek
sleep 2
echo -e "[ ${green}INFO${NC} ] Processing to stop $Cek " 
sleep 1
fi
echo -e "[ ${green}INFO${NC} ] Starting renew cert... " 
sleep 2
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
echo -e "[ ${green}INFO${NC} ] Renew cert done... " 
sleep 2
echo -e "[ ${green}INFO${NC} ] Starting service $Cek " 
sleep 2
echo $domain > /etc/xray/domain
systemctl restart xray
systemctl restart nginx
echo -e "[ ${green}INFO${NC} ] All finished... " 
sleep 0.5
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
}
export sem=$( curl -s https://raw.githubusercontent.com/artanodrop/permission/main/versions)
#export pak=$( cat /home/.ver)
IPVPS=$(curl -s ipinfo.io/ip )
clear
echo -e ""
echo -e ""
echo -e "               ${BIPurple}Premium Script : ${BIPurple}Ramli${NC}"
echo -e "              ${BIPurple} SCRIPT MULTI V4.0 STABILE " | lolcat
echo -e "${BIYellow} ┌─────────────────────────────────────────────────────┐" | lolcat
echo -e "${BIYellow} │                     Informations                    |"
echo -e "${BIYellow} │=====================================================|" | lolcat
echo -e "${BIYellow} | ${BIWhite}Time Zone       :  $WKT${NC}"
echo -e " ${BIYellow}│ ${BIWhite}Use Core        :  ${BIWhite}XRAY${NC}"
echo -e "${BIYellow} | ${BIWhite}CPU Usage       :  $cpu_usage${NC}"
echo -e " ${BIYellow}│ ${BIWhite}Current Domain  :  ${BIWhite}$(cat /etc/xray/domain)${NC}"
echo -e " ${BIYellow}│ ${BIWhite}NS Domain       :  ${BIYellow}$(cat /root/nsdomain)${NC}"
echo -e " ${BIYellow}│ ${BIWhite}IP-VPS          :  ${BIRed}$IPVPS "
echo -e " ${BIYellow}└─────────────────────────────────────────────────────┘" | lolcat
echo -e "     ${BIWhite} SSH ${NC}: $ressh"" ${BIWhite} NGINX ${NC}: $resngx"" ${BIWhite}  XRAY ${NC}: $resv2r"" ${BIWhite} TROJAN ${NC}: $resv2r${NC}"
echo -e "   ${BIWhite}     STUNNEL ${NC}: $resst" "${BIWhite} DROPBEAR ${NC}: $resdbr" "${BIWhite} SSH-WS ${NC}: $ressshws${NC}"
echo -e "${BIYellow} ┌─────────────────────────────────────────────────────┐" | lolcat
echo -e "${BIYellow} │                       OTHER MENU                    │ "
echo -e "${BIYellow} │=====================================================│" | lolcat
echo -e "${BIYellow} │${NC}${BIYellow} [•1]${NC}📨 ${BIWhite} SSH${NC}             " "${BIYellow}[•7]${NC}📨 ${BIWhite} CHECK RUNNING${NC}"
echo -e "${BIYellow} │${NC}${BIYellow} [•2]${NC}📨 ${BIWhite} VMESS${NC}           " "${BIYellow}[•8]${NC}📨 ${BIWhite} RESTR SERVICE${NC}"       
echo -e "${BIYellow} │${NC}${BIYellow} [•3]${NC}📨 ${BIWhite} VLESS${NC}           " "${BIYellow}[•9]${NC}📨 ${BIWhite} BACKUP MENU${NC}  "             
echo -e "${BIYellow} │${NC}${BIYellow} [•4]${NC}📨 ${BIWhite} TROJAN-GO${NC}       " "${BIYellow}[10]${NC}📨 ${BIWhite} CLEAR Ram${NC} "           
echo -e "${BIYellow} │${NC}${BIYellow} [•5]${NC}📨 ${BIWhite} TROJAN-WS${NC}       " "${BIYellow}[11]${NC}📨 ${BIWhite} UPDATE${NC} "
echo -e "${BIYellow} │${NC}${BIYellow} [•6]${NC}📨 ${BIWhite} MENU SETINGS${NC}    " "${BIYellow}[12]${NC}📨 ${BIWhite} check port${NC} "
echo -e "${BIYellow} └──────────────────────────────────────────────────────┘" | lolcat 
echo -e "${BIYellow} ┌─────────────────────────────────────────────────────┐" | lolcat
echo -e "${BIYellow} │ \033[0m ${BOLD}${GREEN}XXX${BIYellow} SSH${GREEN}  XXX  ${BIYellow}VMESS  ${GREEN}XXX  ${BIYellow}VLESS  ${GREEN}XXX  ${BIYellow}TROJAN${GREEN} XXX ${NC} "
echo -e "${BIYellow} │ \033[0m ${Blue}     $ssh1          $vma           $vla            $tra              "
echo -e "${BIYellow} └─────────────────────────────────────────────────────┘" | lolcat
echo -e "${BIYellow} ┌─────────────────────────────────────────────────────┐" | lolcat
echo -e "${BIYellow} │$NC ${BIYellow}HARI ini${NC}: ${BIYellow}$ttoday$NC ${BIYellow}KEMARIN${NC}: ${red}$tyest$NC ${BIYellow}BULAN${NC}: ${BIYellow}$tmon$NC $NC"
echo -e "${BIYellow} └─────────────────────────────────────────────────────┘" | lolcat
echo -e " ┌─────────────────────────────────────┐" | lolcat
echo -e " │ Version      ${NC} : ${BIPurple} Ver4. Last Update"
echo -e " │ User       ${NC}   : ${BIWhite} $Name"
echo -e " │ Expiry script${NC} : ${BIYellow} $useexp"
echo -e " └─────────────────────────────────────┘" | lolcat
echo
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; menu-sshh ;;
2) clear ; menu-vmess ;;
3) clear ; menu-vless ;;
4) clear ; menu-trgo ;;
5) clear ; menu-trojan ;;
6) clear ; menu-set ;;
7) clear ; status ;;
8) clear ; restarts ;;
9) clear ; menu-backup ;;
10) clear ; clearcache ;;
11) clear ; rm -rf /root/updatefile.sh && wget https://raw.githubusercontent.com/Ramli5941/v4/main/updatefile.sh && chmod +x updatefile.sh && ./updatefile.sh ;;
12) clear ; about ;;
00) clear ; menu ;;
x) exit ;;
*) echo -e "" ; echo "Press any key to back exit" ; sleep 1 ; exit ;;
esac