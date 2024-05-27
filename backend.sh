pwd=$PWD
echo disabling and enabling latest nodejs module
dnf module disable nodejs -y      &>> /tmp/expense.log
dnf module enable nodejs:18 -y    &>> /tmp/expense.log

echo installing nodejs
dnf install nodejs -y     &>> /tmp/expense.log

rm -rf /app

echo adding user
useradd sri       &>> /tmp/expense.log

echo creating directory 
mkdir /app      &>> /tmp/expense.log

echo downloading backend content and going to the created directory and unzipping backend content
curl -sl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip  &>> /tmp/expense.log
cd /app 
unzip /tmp/backend.zip     &>> /tmp/expense.log

echo downloading dependencies
npm install       &>> /tmp/expense.log

echo copying backend service
cp $pwd/backend.service /etc/systemd/system/backend.service     &>> /tmp/expense.log


echo enabling backend and restarting backend service
systemctl daemon-reload  &>> /tmp/expense.log
systemctl enable backend  &>> /tmp/expense.log
systemctl restart backend  &>> /tmp/expense.log

echo installing mysql client
dnf install mysql -y   &>> /tmp/expense.log

echo loading database
mysql -h mysql.sriharsha.shop -uroot -pSriHarsha@1 < /app/schema/backend.sql    &>> /tmp/expense.log