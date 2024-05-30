log_file=/tmp/expense.log

download_and_extract() {
    curl -sL -o /tmp/$component.zip https://expense-artifacts.s3.amazonaws.com/$component.zip   &>>$log_file
    unzip /tmp/$component.zip  &>$log_file
}

exit_status_check() {
if [ $? -eq 0 ]; then
  echo -e "\e[32mSUCCESS\e[0m"
else
  echo -e "\e[31mFailure\e[0m"
  exit 1
fi
}