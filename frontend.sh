source common.sh
component=frontend

echo install nginx
dnf install nginx -y &>>$log_file
exit_status_check

echo copy expense app configuration
cp expense.conf /etc/nginx/default.d/expense.conf  &>>$log_file
exit_status_check

echo removing old nginx content
rm -rf /usr/share/nginx/html/*  &>>$log_file
exit_status_check

echo go to directory and download frontend content and unzip frontend content
cd /usr/share/nginx/html  &>>$log_file
download_and_extract
exit_status_check

echo enabling and restarting nginx
systemctl enable nginx   &>>$log_file
systemctl restart nginx  &>>$log_file
exit_status_check