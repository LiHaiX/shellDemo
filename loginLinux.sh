!/usr/bin/expect -f
# ssh  root@127.0.0.1 
# 使用expect监听到eof后会输入密码123456
# 可以实现mac登陆远端服务器

set user root
set host 127.0.0.1
set password 123456
set timeout -1

spawn ssh $user@$host
expect "*password:*"
send "$password\r"
interact
expect eof
