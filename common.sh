log_file=/tmp/expense.log

download_and_extract() {
    curl -sL -o /tmp/$component.zip https://expense-artifacts.s3.amazonaws.com/$component.zip   &>>$log_file
    unzip /tmp/$component.zip  &>$log_file>
}