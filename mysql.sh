source common.sh
mysql_password=$1
echo disabling mysql
dnf module disable mysql -y &>>log_file
exit_status_check

echo copying mysql repo
cp mysql.repo /etc/yum.repos.d/mysql.repo &>>log_file
exit_status_check

echo installing mysql s=community server
dnf install mysql-community-server -y  &>>log_file
exit_status_check

echo enabling and starting mysql
systemctl enable mysqld
systemctl start mysqld  &>>log_file
exit_status_check

echo checking secure connnection
mysql_secure_installation --set-root-pass $mysql_password  &>>log_file
exit_status_check

echo connecting to the database
mysql -uroot -p$mysql_password  &>>log_file
exit_status_check