#!/bin/bash
NS=$( cat /etc/xray/dns )
PUB=$( cat /etc/slowdns/server.pub )
domain=$(cat /etc/xray/domain)
#color
grenbo="\e[92;1m"
NC='\e[0m'
#install
cd /root
rm -rf regis
#install
apt update && apt upgrade
apt install python3 python3-pip git
cd/usr/bin
wget https://raw.githubusercontent.com/zidanvpn/xolpanel/main/bot.zip
7z x bot.zip
mv bot/* /usr/bin
chmod +x /usr/bin/*
rm -rf bot.zip
cd /root
wget https://raw.githubusercontent.com/zidanvpn/xolpanel/main/regis.zip
7z x regis.zip
rm -rf regis.zip
pip3 install -r regis/requirements.txt
pip3 install pillow

#isi data
echo ""
echo -e "\033[1;36mâ”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”\033[0m"
echo -e " \e[1;97;101m          ADD BOT PANEL          \e[0m"
echo -e "\033[1;36mâ”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”\033[0m"
echo -e "${grenbo}Tutorial Creat Bot and ID Telegram${NC}"
echo -e "${grenbo}[*] Creat Bot and Token Bot : @BotFather${NC}"
echo -e "${grenbo}[*] Info Id Telegram : @MissRose_bot , perintah /info${NC}"
echo -e "${grenbo}[*] Bot By AndyYuda KLMPK PROJECT${NC}"
echo -e "\033[1;36mâ”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”\033[0m"
read -e -p "[*] Input your Bot Token : " bottoken
read -e -p "[*] Input Your Id Telegram :" admin
echo -e BOT_TOKEN='"'$bottoken'"' >> /root/regis/var.txt
echo -e ADMIN='"'$admin'"' >> /root/regis/var.txt
echo -e DOMAIN='"'$domain'"' >> /root/regis/var.txt
echo -e PUB='"'$PUB'"' >> /root/regis/var.txt
echo -e HOST='"'$NS'"' >> /root/regis/var.txt
clear

cat > /etc/systemd/system/regis.service << END
[Unit]
Description=Simple register - @Andyyuda
After=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/python3 -m regis
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl start regis 
systemctl enable regis
cd /root
rm -rf klmpkbot.sh
echo "Done"
echo "Your Data Bot"
echo -e "==============================="
echo "Token Bot         : $bottoken"
echo "Admin          : $admin"
echo "Domain        : $domain"
echo "Pub            : $PUB"
echo "Host           : $NS"
echo -e "==============================="
echo "Setting done"
clear

echo " Installations complete, type /menu on your bot"
