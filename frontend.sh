source common.sh
component=frontend

echo install nginx
dnf install nginx -y &>>$log_file
if [ $? -eq 0 ]; then
  echo -e "\e[32mSUCCESS\e[0m"
else
  echo -e "\e[31mFailure\e[0m"
fi

echo copy expense app configuration
cp expense.conf /etc/nginx/default.d/expense.conf  &>>$log_file
echo $?

echo removing old nginx content
rm -rf /usr/share/nginx/html/*  &>>$log_file
echo $?

echo go to directory and download frontend content and unzip frontend content
cd /usr/share/nginx/html  &>>$log_file
download_and_extract
echo $?

echo enabling and restarting nginx
systemctl enable nginx
systemctl restart nginx  &>>$log_file
echo $?