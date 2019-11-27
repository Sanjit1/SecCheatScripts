# SecB: Pre Show-off
# Todo: 1.Change the Variables based off the readme.
# * Do it
# Weed : there is a reazon i have a billion colors here
# ? One more color?

# SecB: Variable Def
authorizedUserNames=('batman' 'std' 'chowman')
unauthorizedUserNames=('joker' 'banana' 'homer' 'jonathan')
badPasswordPPl=('chowman')
combinedUsers=('batman' 'std' 'chowman' 'joker' 'banana' 'homer' 'jonathan')
# * Sorry folks I wont spend my time stackoverflowing how to combine 2 arrays DIY

# * Common Defaults
badBoys=('nmap' 'zenmap' 'Wireshark')
disableFTP='nah'
# SecE: Variable Def
# SecE: Pre Show-off


# SecB: Show-off
echo -e '\e[34m'
echo '  /$$$$$$                          /$$   /$$                                   '
echo ' /$$__  $$                        |__/  | $$                                   '
echo '| $$  \__/  /$$$$$$  /$$$$$$$  /$$ /$$ /$$$$$$                                 '
echo '|  $$$$$$  |____  $$| $$__  $$|__/| $$|_  $$_/                                 '
echo ' \____  $$  /$$$$$$$| $$  \ $$ /$$| $$  | $$                                   '
echo ' /$$  \ $$ /$$__  $$| $$  | $$| $$| $$  | $$ /$$                               '
echo '|  $$$$$$/|  $$$$$$$| $$  | $$| $$| $$  |  $$$$/                               '
echo ' \______/  \_______/|__/  |__/| $$|__/   \___/                                 '
echo '                         /$$  | $$                                             '
echo '                        |  $$$$$$/                                             '
echo '                         \______/                                              '
echo '  /$$$$$$            /$$                           /$$$$$$$             /$$    '
echo ' /$$__  $$          | $$                          | $$__  $$           | $$    '
echo '| $$  \__/ /$$   /$$| $$$$$$$   /$$$$$$   /$$$$$$ | $$  \ $$ /$$$$$$  /$$$$$$  '
echo '| $$      | $$  | $$| $$__  $$ /$$__  $$ /$$__  $$| $$$$$$$/|____  $$|_  $$_/  '
echo '| $$      | $$  | $$| $$  \ $$| $$$$$$$$| $$  \__/| $$____/  /$$$$$$$  | $$    '
echo '| $$    $$| $$  | $$| $$  | $$| $$_____/| $$      | $$      /$$__  $$  | $$ /$$'
echo '|  $$$$$$/|  $$$$$$$| $$$$$$$/|  $$$$$$$| $$      | $$     |  $$$$$$$  |  $$$$/'
echo ' \______/  \____  $$|_______/  \_______/|__/      |__/      \_______/   \___/  '
echo '           /$$  | $$                                                           '
echo '          |  $$$$$$/                                                           '
echo '           \______/                                                            '
echo '  /$$$$$$                      /$$             /$$                             '
echo ' /$$__  $$                    |__/            | $$                             '
echo '| $$  \__/  /$$$$$$$  /$$$$$$  /$$  /$$$$$$  /$$$$$$   /$$$$$$$                '
echo '|  $$$$$$  /$$_____/ /$$__  $$| $$ /$$__  $$|_  $$_/  /$$_____/                '
echo ' \____  $$| $$      | $$  \__/| $$| $$  \ $$  | $$   |  $$$$$$                 '
echo ' /$$  \ $$| $$      | $$      | $$| $$  | $$  | $$ /$$\____  $$                '
echo '|  $$$$$$/|  $$$$$$$| $$      | $$| $$$$$$$/  |  $$$$//$$$$$$$/                '
echo ' \______/  \_______/|__/      |__/| $$____/    \___/ |_______/                 '
echo '                                  | $$                                         '
echo '                                  | $$                                         '
echo '                                  |__/                                         '
sleep 1
echo -e '\e[0m'
echo ''
echo 'Hi'
sleep .5
echo 'This is a shell script that is designed to give you a couple of free points on cyber patriot'
sleep .5
# SecE: Show-off


# SecB Post Show-off

# * Sections From checklist: https://github.com/Forty-Bot/linux-checklist

# SecB: 3. Secure Port
sudo sed -i '/PermitRootLogin/d' /etc/ssh/ssh_config
sudo bash -c 'cat <<EOT >> /etc/ssh/ssh_config
    PermitRootLogin no
EOT'
# SecE: 3

# SecB: 4.Secure Users
# SecB: i.Disable Guest User
sudo bash -c 'cat <<EOT >> /etc/lightdm/users.conf
allow-guests=false
EOT'
# * Sudo restart lightdm at the end
# SecE: i

# SecB: ii to v.Users Auth, Sudo and all other jackshit
l=$(grep "^UID_MIN" /etc/login.defs)
l1=$(grep "^UID_MAX" /etc/login.defs)
actualUsers=($(awk -F':' -v "min=${l##UID_MIN}" -v "max=${l1##UID_MAX}" '{ if ( $3 >= min && $3 <= max ) print $1}' /etc/passwd))
authNS=$(awk -F':' '{ if ($1=="sudo") print $4}' /etc/group)
IFS=',' read -ra actualAuthUsers <<< "$authNS"
for i in "${actualUsers[@]}"
do
    if [[ ! " ${combinedUsers[@]} " =~ " ${i} " ]]; then
        sudo userdel -r $i
	echo $i
    fi
done
for i in "${actualAuthUsers[@]}"
do
    if [[ ! " ${authorizedUserNames[@]} " =~ " ${i} " ]]; then
        sudo deluser $i adm
	sudo deluser $i sudo
	echo $i
    fi
done
# SecE: ii to v

# SecB: vi. Media Files Prohibited shit
# TODO: 2.DIY: Media files etc
for i in "${badBoys[@]}"
do
    sudo apt-get remove $i
done
if [[ "$disableFTP" == "yea" ]]; then
    sudo apt-get remove pure-ftpd
    sudo apt-get remove pureftp
fi
# SecE: vi


# SecB: vii. Password Requirements
# SecB: a
sudo sed -i 'PASS_MIN_DAYS' /etc/login.defs
sudo sed -i 'PASS_MAX_DAYS' /etc/login.defs
sudo sed -i 'PASS_WARN_AGE' /etc/login.defs
sudo bash -c 'cat <<EOT >> /etc/login.defs
PASS_MIN_DAYS 7
PASS_MAX_DAYS 90
PASS_WARN_AGE 14
EOT'
# SecE: a
# SecB: b to d
sudo apt-get install libpam-cracklib
sudo sed -i '/pam_unix/s/$/ minlen=8 remember=5/' /etc/pam.d/common-password
sudo sed -i '/cracklib/s/$/ ucredit=-1 lcredit=-1 dcredit=-1 ocredit=-/' /etc/pam.d/common-password
sudo sed -i '/pam_tally2/s/$/ deny=5 unlock_time=1800/' /etc/pam.d/common-auth
chpasswd
# SecE: b to d
# SecE: vii
# SecE: 4


# SecB: 5
# TODO: 3.GO do this shit from GUI do not be lazy
# SecE: 5


# SecB: 6
# TODO: 4.Secure Ports
# SecE: 6


# SecB: 7. Secure Network
sudo ufw enable
sysctl -n net.ipv4.tcp_syncookies
echo "net.ipv6.conf.all.disable_ipv6 = 1" | sudo tee -a /etc/sysctl.conf
echo 0 | sudo tee /proc/sys/net/ipv4/ip_forward
echo "nospoof on" | sudo tee -a /etc/host.conf
# SecE: 7


# SecB: 8
sudo apt-get update
sudo apt-get upgrade
# TODO: 5.Google how to update services mentioned in readme
# SecE 8





echo 'Wait.. '

sleep 3

echo 'Uh oh this is not good!'

sleep 3

echo 'oh sh** we screwed up'

sleep 5

echo 'Nah just joking Sorry.'

sleep .5

echo 'Follow me on Github @Sanjit1'


sudo restrat lightdm