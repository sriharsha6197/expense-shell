source common.sh
component=backend

echo disabling and enabling latest nodejs module
dnf module disable nodejs -y      &>>$log_file
dnf module enable nodejs:18 -y    &>>$log_file
exit_status_check

echo installing nodejs
dnf install nodejs -y     &>>$log_file
exit_status_check

rm -rf /app

echo adding user
useradd sri       &>>$log_file
exit_status_check

echo creating directory 
mkdir /app      &>>$log_file

echo copying backend service
cp backend.service /etc/systemd/system/backend.service     &>>$log_file
exit_status_check

echo downloading backend content and going to the created directory and unzipping backend content
cd /app
download_and_extract
exit_status_check

echo downloading dependencies
npm install       &>>$log_file
exit_status_check

echo enabling backend and restarting backend service
systemctl daemon-reload  &>>$log_file
systemctl enable backend  &>>$log_file
systemctl restart backend  &>>$log_file
exit_status_check

echo installing mysql client
dnf install mysql -y   &>>$log_file
exit_status_check

echo loading database
mysql -h mysql.sriharsha.shop -uroot -pSriHarsha@1 < /app/schema/backend.sql    &>>$log_file
exit_status_check