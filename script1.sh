#!/bin/bash

if [ $# -lt 3 ]
then
  echo 'Please, specify users, group and ssh or password as arguments.'
  exit
fi

auth=$3
if [ $auth != 'ssh' ] && [ $auth != 'password' ]
then
  echo 'Please specify auth type as third argument - ssh or password.'
  exit
fi

group=$2
if id -g $group >/dev/null 2>&1;
then
  echo "Group already exist, users would be added to it."
else
  groupadd $group
fi

IFS=',' #or $(echo $1 | sed "s/,/ /g")
for user in $1
do
  if id -u $user >/dev/null 2>&1;
    then
    echo "User $user already exists, he will be added to the $group group"
  else
    echo "user $user add to $group"
    useradd -g $group $user
  fi

  if [ $auth = 'ssh' ]
  then
    ssh-keygen -t rsa -N "" -f $user
  else
    passwd $user
  fi

done
unset IFS
