authorizedUserNames=()
unauthorizedUserNames=()
badPasswordPPl=()
peopleToAdd=()
combinedUsers=("${unauthorizedUserNames[@]}" "${authorizedUserNames[@]}")

sudo bash -c 'cat <<EOT >> /etc/lightdm/users.conf
allow-guests=false
EOT'


sudo apt-get update
sudo apt-get upgrade
sudo apt-get update


for i in "${peopleToAdd[@]}"
do
    sudo useradd $i
done


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

sysctl -n net.ipv4.tcp_syncookies
echo "net.ipv6.conf.all.disable_ipv6 = 1" | sudo tee -a /etc/sysctl.conf
echo 0 | sudo tee /proc/sys/net/ipv4/ip_forward
echo "nospoof on" | sudo tee -a /etc/host.conf

sudo apt-get autoclean
sudo apt-get install --only-upgrade bash

sudo ufw enable
sudo ufw default deny incoming
sudo ufw allow from 127.0.0.1 to any port 631
sudo ufw allow from 127.0.0.1 to any port 53
sudo ufw allow ssh
sudo ufw allow http
sudo ufw status verbose
read -n1 -r -p "Press space to continue..." key

echo "tmpfs     /run/shm     tmpfs     defaults,noexec,nosuid     0     0"
read -n1 -r -p "Press space to continue..." key
sudo nano /etc/fstab

echo "Port <ENTER YOUR PORT>"
echo "Protocol 2"
echo "PermitRootLogin no"
echo "DebianBanner no"
read -n1 -r -p "Press space to continue..." key
sudo nano /etc/ssh/sshd_config

echo "sudo vi /etc/sysctl.conf find on the page"
read -n1 -r -p "Press" key
sudo nano /etc/sysctl.conf

echo "recursion no;"
echo "version quote Not Disclosed quote;"
read -n1 -r -p "Pres" key
sudo nano /etc/bind/named.conf.options

echo "order bind,hosts"
ehco "nospoof on"
read -n1 -r -p "enter" key
sudo nano /etc/host.conf


sudo service bind9 restart
sudo sysctl -p
sudo service ssh restart


sudo apt-get install tiger tripwire

sudo less /var/log/tiger/security.report.*