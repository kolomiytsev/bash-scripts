#!/bin/bash

keyword="ssh"
ssh_key="~/.ssh/id_rsa"

if [ $# -lt 2 ] || [ $# -gt 6 ]
then
  echo 'Please, specify log file and remote system as arguments, up to five remote systems'
  exit
fi

for ((i=2;i<=$#;i++)); do
    action="cat $1 | grep $keyword"
    ssh -q -i $ssh_key -o StrictHostKeyChecking=no ${!i} [[ -f $1 ]] && ssh -tt -i $ssh_key -o StrictHostKeyChecking=no ${!i} $action || echo "$1 file does not exist at ${!i} host"
done
