# Changer le nom de la debian de maniere automatique
sudo sed -i "s/debian/Pr14JDKjre/g" /etc/hostname /etc/hosts
sudo reboot
# Effectuer un SnapShot sur la vm work de debian 
# Remmettre a jours les diffrents telechargement
sudo apt update
# Chercher l'openjdk (java kit de developpement jdk + jre)
sudo apt search openjdk
# Choisir le java a utiliser (le jdk comprend a l'interieur le JRE)
sudo apt install openjdk-11-jdk 
# Verifier si le jdk est bien present
java --version
javac --version
jar --version
# Installer maven pour pouvoir compiler, nettoyer et constuire une application java
sudo apt install maven
# Effectuer un git clone (git clone https://github.com/matthcol/devops2023S1.git)
# Lors d'un git pull pour eviter d'avoir un warning en jaune effectuer : git config --global pull.rebase false
# Se positionner sur l'application (ex: /devops2023S1/javaapps/bonjourwebapp) 
# Effectuer une premiere compilation (mvn compile)
# Nettoyer et constuire (mvn clean package)
# Consulter mon fichier .war avec la commande JAR (ex: jar tvf target/bonjour-1.0.war)
# Pour transferer mon fichier .war vers ma vm où il y a Tomcat (ex: scp target/bonjour-1.0.war djawed@192.168.186.132:/tmp) entrer mon mot de passe utilisateur
--------------------------------------------------------------------------------------------
# Aller dans le JRE TOMCAT
--------------------------------------------------------------------------------------------
# Nettoyer et constuire (mvn clean package)
# Consulter mon fichier .war avec la commande JAR (ex: jar tvf target/bonjour-1.0.war)
# Pour transferer mon fichier .war vers ma vm où il y a Tomcat (ex: scp target/bonjour-1.0.war djawed@192.168.186.132:/tmp) entrer mon mot de passe utilisateur
--------------------------------------------------------------------------------------------
# Aller dans le JRE TOMCAT
--------------------------------------------------------------------------------------------
# Créer un jeu de clé (ex: ssh-keygen)
# Entrée le chemin et renommer mon jeu de clé (ex: /home/djawed/.ssh/id_rsa_tomcat9)
# Entrer la passphrase (ex: jemappellejaoidkrairi) deux fois de suite
# Verifier le dossier .shh créer de maniere automatique avec ses droits (ex: ls -al /home/djawed/.ssh)
# On constate que le dossier est très protégé et j'ai mon jeu de clé privé ne peut pas être lu et ma clé public qui peut être lu
# Copîer ma clé public vers ma vm où il y a Tomcat (ex: scp /home/djawed/.ssh/id_rsa_tomcat9.pub djawed@192.168.186.132:/tmp) entrer mon mot de passe utilisateur
--------------------------------------------------------------------------------------------
# Aller dans le JRE TOMCAT
--------------------------------------------------------------------------------------------

# Se connecter avec tomi en precisant la clé que je veux utiliser (ex: ssh -i ~/.ssh/id_rsa_tomcat9 tomi@192.168.186.132)
# Entrer la passphrase (ex: jemappellejaoidkrairi)
# On constate que je suis connecter en tomi je peux faire par exemple (ex: systemctl status tomcat9)
# Sortir de l'utilisateur tomi (ex: Ctrl+d)
# Pour rendre la clé utilisable (ex: ssh-agent)
# Copier coller et executer ce qui est affiché
# Vérifier que le ssh agent tourne (ex: ps -aef | grep ssh-agent)



