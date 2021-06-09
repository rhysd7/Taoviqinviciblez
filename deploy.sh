#!/bin/bash 
git filter-branch --env-filter ' 
timeStamp=`date +%s`
# 加3年半
let futureTime=$timeStamp+$[$RANDOM*1]
# 减12个月  30000000
# 11个月  27500000
let startTime=$timeStamp-27500000
# 平均值
let avg=(futureTime-startTime)/1000
# 增加波动值
let time=$startTime+$avg+$RANDOM
let index=$index+1
let countadd=$countadd+$RANDOM*10
let c=$countadd+$startTime
echo "********"

CORRECT_NAME='$2'
CORRECT_EMAIL='$3'

if [ $GIT_COMMIT != 119f9ecf58069b265ab22f1f97d2b648faf932e0 ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
    export GIT_AUTHOR_DATE="$c"
    export GIT_COMMITTER_DATE="$c"
fi

' --tag-name-filter cat -- --branches --tags