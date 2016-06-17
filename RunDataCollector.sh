#! /usr/bin/expect -f

set timeout -1

spawn ssh -l pi 192.168.0.102

expect "password:"
send "raspberry\r"

expect "@"
send "cd Desktop\r"
expect "@"
send "ls\r"

set timeout 5
expect "output.txt" {
    expect "@"
    send "rm output.txt\r"
}

set timeout -1
expect "@"
send "bash autoRunLocation\r"

expect "done"
send "exit\r"

spawn scp pi@192.168.0.102:/home/pi/Desktop/metrics.txt /Users/Patrick/Desktop/ShoppingCartMetrics.txt

expect "password:"
send "raspberry\r"

expect "100%"

# End Of File