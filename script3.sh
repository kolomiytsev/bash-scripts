#!/bin/bash
#cat <(fgrep -i -v "$command" <(crontab -l)) <(echo "$job") | crontab -  as alternative to manual crontab -e setup
pathToConfig='config_script3.txt'
pathToResult='result.txt'
scriptStart=$(date +'%s')
executionTime=2400  #40 minutes
scriptExecutionFinish=$(($scriptStart + $executionTime))

IFS="="
while read -r name value
do
    if [ $name == 'interval' ]
    then
        interval=$value
    elif [ $name == 'urlList' ]
    then
        urlList=$value
    elif [ $name == 'keyword' ]
    then
        keyword=$value
    fi
done < $pathToConfig
unset IFS

while [ "$(date +'%s')" -le $scriptExecutionFinish ]
do
    IFS=','
    for url in $urlList
    do
        if [ $RANDOM -le $RANDOM ]
        then
            keywordAmount=$(curl -s -L $url | grep $keyword | wc -l | sed -e 's/^[ \t]*//')
            echo "Keyword $keyword at $(date +'%d/%m/%Y %H:%M:%S') found $keywordAmount time(s) on $url page" >> $pathToResult
        fi
    done
    sleep $interval
    unset IFS
done
