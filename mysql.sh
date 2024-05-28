source common.sh

echo disabling mysql
dnf module disable mysql -y &>>log_file
echo $?

echo copying mysql repo
cp mysql.repo /etc/yum.repos.d/mysql.repo &>>log_file
echo $?

echo installing mysql s=community server
dnf install mysql-community-server -y  &>>log_file
echo $?

echo enabling and starting mysql
systemctl enable mysqld
systemctl start mysqld  &>>log_file
echo $?

echo checking secure connnection
mysql_secure_installation --set-root-pass SriHarsha@1  &>>log_file
echo $?

echo connecting to the database
mysql -uroot -pSriHarsha@1  &>>log_file
echo $?