pwd=$PWD
echo update packages
dnf update -y  &>> /tmp/expense.log

echo install nginx
dnf install nginx -y &>> /tmp/expense.log

echo removing old nginx content
rm -rf /usr/share/nginx/html/*  &>> /tmp/expense.log

echo enabling and restarting nginx
systemctl enable nginx
systemctl restart nginx  &>> /tmp/expense.log

echo go to directory and download frontend content and unzip frontend content
cd /usr/share/nginx/html  &>> /tmp/expense.log
curl -sL -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip   &>> /tmp/expense.log
unzip /tmp/frontend.zip  &>> /tmp/expense.log


echo copy expense app configuration
cp $pwd/expense.conf /etc/nginx/default.d/expense.conf  &>> /tmp/expense.log