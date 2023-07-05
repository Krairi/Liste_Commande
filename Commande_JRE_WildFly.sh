# Changer le nom de la debian de maniere automatique
sudo sed -i "s/debian/Pr14JREWildFly/g" /etc/hostname /etc/hosts
sudo reboot