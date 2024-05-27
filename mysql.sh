echo disabling mysql
dnf module disable mysql -y

echo copying mysql repo
cp mysql.repo /etc/yum.repos.d/mysql.repo

echo installing mysql s=community server
dnf install mysql-community-server -y

echo enabling and starting mysql
systemctl enable mysqld
systemctl start mysqld  

echo checking secure connnection
mysql_secure_installation --set-root-pass SriHarsha@1

echo connecting to the database
mysql -uroot -pSriHarsha@1