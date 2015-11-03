#!/bin/bash

# Refs.
# * http://futurismo.biz/archives/1272
# * http://www.math.kobe-u.ac.jp/‾kodama/tips-expect.html

# ログイン情報を入力
hostname=host
username=user
password=pass
target="${*}"

# expect コマンドを実行
expect -c "
# タイムアウト値の指定
set timeout 20
# spawnで新しいジョブ生成
spawn telnet $hostname
# login
expect login:
send \"$username\n\"
expect Password:
send \"$password\n\"
expect \"$ \"
if {{$target} != {""}} {
	send \"ssh $target\n\"
	expect \"$ \"
}
# spawnジョブを通常の通信にする
interact
"

