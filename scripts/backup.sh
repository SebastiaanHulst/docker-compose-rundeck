#!/bin/bash

checkdir() {
  if [ ! -d data ] ; then
    mkdir data
  fi
}

backupdatabase() {
  echo -n "Backing up database: "
  docker exec mysql sh -c 'exec mysqldump -uroot -p"rundeck" rundeck' > data/database.mysql 2> /dev/null
  if [ $? = 0 ] ; then
    echo "Okay."
  else
    echo "Failed."
  fi
}

backupfiles() {
  echo -n "Backing up files: "
  for directory in /var/rundeck /var/lib/rundeck/var/storage /var/lib/rundeck/logs ; do
    filename=$(echo ${directory} | sed 's%/%%g').tar.gz
    docker exec rundeck /bin/bash -c "cd ${directory} ; tar -czf - *" > data/${filename}
  done
  if [ $? = 0 ] ; then
    echo "Okay."
  else
    echo "Failed."
  fi
}

checkdir
backupdatabase
backupfiles
