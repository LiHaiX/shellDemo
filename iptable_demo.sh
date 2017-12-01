#!/bin/sh
a=$1

# 去掉iptable规则
function iptable_close(){
    echo "stop begin"
    sudo iptables -t nat -D OUTPUT -d 源 -p tcp --dport 25100 -j DNAT --to 目标：端口
    sudo iptables -t nat -D OUTPUT -d 127.0.0.1 -p tcp --dport 25100 -j DNAT --to 127.0.0.1:25100
    echo "stop end"
    }

# 添加iptable规则
function iptable_open(){
    echo "stop begin"
    sudo iptables -t nat -I OUTPUT -d 源 -p tcp --dport 25100 -j DNAT --to 目标：端口
    sudo iptables -t nat -I OUTPUT -d 127.0.0.1 -p tcp --dport 25100 -j DNAT --to 127.0.0.1:25100
    echo "stop end"
    }

# 查询当前iptable规则
function iptable_list(){
    sudo iptables -L -nv -t nat
    }

case $1 in
        start | begin)
        iptable_open
        ;;
        stop | end)
        iptable_close
        ;;
        l | L)
        iptable_list
        ;;
esac
