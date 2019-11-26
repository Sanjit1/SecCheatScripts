# TODO: Add variables



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


sudo sed -i '/PermitRootLogin/d' /etc/ssh/ssh_config
sudo bash -c 'cat <<EOT >> /etc/ssh/ssh_config
PermitRootLogin no
EOT'































echo ''
echo 'Delete users(Give Username seperated with " "(which is a space))'

read userlist

for w in $userlist; do
    sudo userdel -r $w
done

echo 'Successfully Deleted all trash users    I guess'








sleep .5

echo 'Installing openssl do not ask why'

sleep .5

sudo apt-get install libssl-dev

sleep .5

echo 'Change Passwords(Give Username seperated with " "(which is a spce))'
echo 'Dont worry I will echo a new (and secure) password'
echo -e 'You will have to re-enter the password that I tell you \e[131mCAREFULLY\e[0m, and then \e[131mNOTE\e[0m it down.'

sleep .5

read usersWhoAreIdiots

for w in $usersWhoAreIdiots; do
    openssl rand -base64 10
    sudo passwd $w
done

sleep .5

echo 'Enabling Firewall'

sudo ufw enable

sleep .5

echo 'Check if FTP is enabled'

sleep 1

service --status-all

sleep .5

echo 'Is that piece of Garbage enabled, and you wanna disable it? use y or n'

read -p "Do you wish to install this program y/n?" yn
case $yn in
    [Yy]* ) sudo apt-get remove pureftp;;
    [Nn]* ) echo OK wont remove FTP;;
    * ) echo "Please answer y or n."
        read -p "Do you wish to install this program y/n?" yn
        case $yn in
            [Yy]* ) sudo apt-get remove pureftp;;
            [Nn]* ) echo OK wont remove FTP;;
            * ) echo "Your f**king stupid.";;
    esac;;
esac


echo 'did it work? I hope it did'

sleep 1

echo 'Time to remove prohibited software.'

sleep 1

echo 'Wait.. '

sleep 3

echo 'Uh oh this is not good!'

sleep 3

echo 'oh sh** we screwed up'

sleep 4

echo 'Nah just joking Sorry.'

sleep .5

echo 'Now lests get back to where we were'

echo 'Tell me what softwaree we need to remove (Give appname seperated with " "(which is a space))'

read badApps

for w in $badApps; do
    sudo apt-get remove $w
done


echo 'I took care of most things'

sleep 1

echo 'Now you need to do stuff too, GUI stuff'

echo 'Delete a person who aint an admin'
echo 'Set daily updates'
echo 'Install updates from important security updates'
echo 'Firefox popup blocker'
echo 'Remove prohibited files'

sleep 1

echo 'and...'

sleep 1.5

echo 'Follow me on Github @Sanjit1'

sleep .5

echo 'NO like seriously I need followers'
