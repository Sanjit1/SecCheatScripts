# SecB: Variable Def
authorizedUserNames=('batman' 'std' 'chowman')
unauthorizedUserNames=('joker' 'banana' 'homer' 'jonathan')
badPasswordPPl=('chowman')
combinedUsers=('batman' 'std' 'chowman' 'joker' 'banana' 'homer' 'jonathan')
# * Sorry folks I wont spend my time stackoverflowing how to combine 2 arrays DIY

# * Common Defaults
badBoys=('nmap' 'zenmap' 'Wireshark' 'john' 'samba' 'vsftpd')
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
echo '  /$$$$$$                      /$$             /$$                     	        '
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

sudo add-apt-repository main
sudo add-apt-repository universe
sudo add-apt-repository restricted
sudo add-apt-repository multiverse

sudo apt-get update
sudo apt-get upgrade

sudo apt-get purge john

sudo apt-get purge samba

sudo apt-get purge vsftpd

# SecB Post Show-off
sudo adduser theseus
sudo deluser --remove-home gellbert
sudo deluser --remove-home credence
sudo deluser queenie sudo
echo 'tHisI5def1nat3lyAgoo4P@$$wd' | sudo passwd jacob

sudo bash -c 'cat <<EOT >> /etc/lightdm/users.conf
allow-guests=false
EOT'



sudo sed -i '/PASS_MIN_DAYS/d' /etc/login.defs
sudo sed -i '/PASS_MAX_DAYS/d' /etc/login.defs
sudo sed -i '/PASS_WARN_AGE/d' /etc/login.defs
sudo sed -i '/PASS_MIN_LEN/d' /etc/login.defs
sudo bash -c 'cat <<EOT >> /etc/login.defs
PASS_MIN_DAYS 7
PASS_MAX_DAYS 90
PASS_MIN_LEN 8
PASS_WARN_AGE 14
EOT'


sudo apt-get install libpam-cracklib


sudo sed -i '/pam_unix.so/d' /etc/pam.d/common-password
sudo sed -i '/pam_cracklib/d' /etc/pam.d/common-password
sudo sed -i '/pam_deny/d' /etc/pam.d/common-password
sudo bash -c 'cat <<EOT >> /etc/pam.d/common-password
password	[success=1 default=ignore]	pam_unix.so obscure use_authtok try_first_pass sha512 minlen=8 remember=5
password	required			pam_cracklib.so retry=3 minlen=8 difok=3 ucredit=-1 lcredit=-1 dcredit=-1 ocredit=-1
password	requisite			pam_deny.so
EOT'

sudo sed -i '/pam_tally2.so/d' /etc/pam.d/common-auth
sudo bash -c 'cat <<EOT >> /etc/pam.d/common-auth
auth		required			pam_tally2.so deny=5 unlock_time=1800
EOT'

sudo service cron stop

sudo apt-get purge netcat


sudo apt-get purge netcat

