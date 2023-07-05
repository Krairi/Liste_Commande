# Changer le nom de la debian de maniere automatique
sudo sed -i "s/debian/Pr14JRETomcat/g" /etc/hostname /etc/hosts
sudo reboot
# Effectuer un SnapShot sur la vm work de debian 
# Remmettre a jours les diffrents telechargement
sudo apt update
# Chercher l'openjdk (jre l'environnement java uniquement)
sudo apt search openjdk
# Choisir le java a utiliser (le JRE uniquement)
sudo apt install openjdk-11-jre
# Verifier si le jdk est bien absent
java --version
javac --version
jar --version
# Installer tomcat9
sudo apt install tomcat9
# Activer le service tomcat9 au dèmarrage
sudo systemctl enable tomcat9
# Démmarrer le service tomcat9
sudo systemctl start tomcat9
# Vérifier si le service fonctionne
sudo systemctl status tomcat9
# Verifier sur quel port fonctionne le service et constater que tomcat9 fonctionne sur Java port :8080
sudo netstat -tuplan | grep -i listen
----------------------------------------------------------
# Aller construire l'application dans le JDK
----------------------------------------------------------
# verifier que que sur le repertoire tmp de ma vm que le fichier .war est bien arrivé (ex: ls /tmp)  
# En ouvrant un navigateur sur par exemple http//:192.168.186.132:8080
# On constate un chemin qui est : /var/lib/tomcat9/
# Verifier ce qu'il y a dedans par exemple: ls -al /var/lib/tomcat9/ (on constate le webapps qui va acceuillir les applications web)
# Verifier ce qu'il y a dans le dossier webapps (on constae des dossiers qui appartient a TOMCAT et d'autres a ROOT)
# Ce qui est important c'est que le repertoire appartienne a TOMCAT donc l'utilisateur est TOMCAT
# Verifier qui est l'utilisateur avec la commande : ps -aef | grep tomcat
# On constate le processus de fonctionnement et que l'utilisateur est bien Tomcat
# Se positionner sur le repertoir Webapps (ex: cd /var/lib/tomcat9/webapps)
# Verifier qui est l'utilisateiur (ex: ls -l)
# On constate que ROOT est l'utilisateur
# Copier le fichier .war present dans le dossier tmp vers le dossier webapps (ex: sudo cp /tmp/bonjour-1.0.war .)
# Verifier comment se presente le fichier .war (ex: ls -l)
# On constate que pour l'utilisateur tomcat le fichier .war a été decompresser (ex: bonjour-1.0) et pour l'utilisateur root le fichier .war n'est pas decompresser
# En ouvrant un navigateur sur par exemple http//:192.168.186.132:8080/bonjour-1.0/bonjour
# Pour supprimer les 2 fichiers qui a été construit dans le JDK la commande (ex: sudo rm bonjour-1.0.war)
# Pour vérifier les fichiers journaux (ex: sudo ls logs)
# On constate 4 fichier journaux
------------------------------------------------------
# Retourner dans le JDK
------------------------------------------------------
# verifier que que sur le repertoire tmp de ma vm que le fichier .war est bien arrivé (ex: ls /tmp)  
# Se positionner sur le repertoir Webapps (ex: cd /var/lib/tomcat9/webapps)
# Copier le fichier .war present dans le dossier tmp vers le dossier webapps en le renoman (ex: sudo cp /tmp/bonjour-1.0.war bonjour.war)
# Pour verifier l'arborecence commande (ex: sudo tree)
# Pour verifier si on peut être utilisateur tomcat (ex: sudo su tomcat)
# On remarque que l'on ne peut pas être user Tomcat il faut créer un utilisateur qui fasse partie du groupe tomact 
# Créer un utilisateur tomi faisant partie du groupe tomcat avec un home directory par defaut et preciser son shell (ex: sudo useradd -m -s /usr/bin/bash tomi )
# Se connecter en tant que tomi (ex: sudo su - tomi)
# Verifier où je suis (ex: pwd)
# Verifier les fichier configuration par defaut (ex: ls -a)
# Verifier le bash existe quand je me connect avec ce user tomi (ex: echo $SHELL ou en faisant ps)
# Sortir de l'utilisateur tomi (ex: Ctrl+d)
# Verifier le group de tomi (ex: groups tomi)
# Mettre tomi dans le groupe tomcat (principale) pour deployer et retirer des applications tomcat (ex: sudo usermod -g tomcat tomi)
# Se connecter en tant que tomi (ex: sudo su - tomi)
# Verifier se que contient le repertoire webapp (ex: ls /var/lib/tomcat9/webapps)
# Se positionner sur le repertoir Webapps (ex: cd /var/lib/tomcat9/webapps)
# L'utilisateur tomi peut supprimer des applications tomcat (ex: rm bonjour.war)
# Sortir de l'utilisateur tomi (ex: Ctrl+d)
# Se connecter en tant que tomi (ex: sudo su - tomi)
# Verifier les droits (ex: umask)
# Se positionner sur le repertoir Webapps (ex: cd /var/lib/tomcat9/webapps)
# Copier le fichier .war present dans le dossier tmp vers le dossier webapps en le renoman (ex: cp /tmp/bonjour-1.0.war bonjour.war)
# Verifier que le mask que j'ai mis en place le .war est  (ex: ls -l) 
------------------------------------------------------
# Retourner dans le JDK
------------------------------------------------------
# verifier que que sur le repertoire tmp de ma vm que le fichier .war est bien arrivé (ex: ls /tmp)
# Verifier où je suis (ex: pwd)
# Modifier le fichier .bashrc en ajoutant un a la fin du fichier umask 077 pour retirer tous les droits pour les personnes du groups (ex: vi .bashrc)
# Créer un repertoir dans tomi (ex: mkdir .ssh)
# Verifier les droits (ex: ls -dl .ssh)
# Créer un fichier special qui se nomme authorized_keys toutes les clé qui seront contenu dans se fichier me permettront de me connecter
# Copier le contenue de la clé dans un fichier special (ex: cat /tmp/id_rsa_tomcat9.pub >> .ssh/authorized_keys) 
# Verifier les droits des repertoires (ex: ls -al .ssh)
------------------------------------------------------
# Retourner dans le JDK
------------------------------------------------------















