# Changer le nom de la debian de maniere automatique
sudo sed -i "s/debian/Pr14MariaDB/g" /etc/hostname /etc/hosts
sudo reboot
# Relancer le serveur Nat
sudo ifdown ens33
sudo ifup ens33
# Effectuer une mise à jours
sudo apt update
# Installer MariaDB
sudo apt install mariadb-server mariadb-client -y
# Activer le service MariaDB au dèmarrage
sudo systemctl enable mariadb
# Démmarrer le service MariaDB
sudo systemctl start mariadb
# Vérifier si le service fonctionne
sudo systemctl status mariadb
# Installer le root MariaDB(None,yyyyyyyy)
sudo mysql_secure_installation
# Relancer le serveur Nat
sudo ifdown ens33
sudo ifup ens33
# Cloner le dépot git
git clone -b maria-nodocker https://github.com/matthcol/dbmovie.git
# Aller dans le 1er répertoire du git cloné
cd dbmovie/sql
# Effectuer un VI sur le fichier création utilisateur et modifier l'* par %
sudo vi 00-create-db-user.sql
# En effectuant un cat ../Readme.md celà me permet d'effectuer les commandes suivantes:
# Créer un utilisateur avec un nom base de donnée plus les droit d'accés
sudo mysql -u root < 00-create-db-user.sql
# Charger la base de données
mysql -u movie -p dbmovie < maria_movie_all.sql
# Consulter le nouvel utilisateur avec sa base de données(MP:password)
mysql -u movie -p dbmovie
# Sortir
EXIT;
# Aller dans le répertoire
cd /etc/mysql/mariadb.conf.d/
# Modifier le localhost par '*' et ajouter le port = 3307
sudo vi 50-server.cnf
# Redémmarrer le service MariaDB
sudo systemctl restart mariadb
# Verifier si MariaDB fonctionne
sudo netstat -tuplan | grep -i listen
