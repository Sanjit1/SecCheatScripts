authorizedUserNames=('batman' 'std' 'chowman')
unauthorizedUserNames=('joker' 'banana' 'homer' 'jonathan')
badPasswordPPl=('chowman')
combinedUsers=('batman' 'std' 'chowman' 'joker' 'banana' 'homer' 'jonathan')

sudo bash -c 'cat <<EOT >> /etc/lightdm/users.conf
allow-guests=false
EOT'


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

sudo apt-get install gksu wget

wget https://www.thefanclub.co.za/sites/default/files/public/downloads/ubuntu-server-secure.tar.gz

sudo tar -zxvf ubuntu-server-secure.tar.gz

sudo chmod +x ubuntu-server-secure/ubuntu-server-secure.sh

gksudo sh ubuntu-server-secure/ubuntu-server-secure.sh
