#!/bin/bash

restoredatabase() {
  echo -n "Restoring database: "
  docker exec -i mysql mysql -uroot -p"rundeck" rundeck < data/database.mysql > /dev/null 2>&1
  if [ $? = 0 ] ; then
    echo "Okay."
  else
    echo "Failed."
  fi
}

restorefiles() {
  echo -n "Restoring files: "
  for directory in /var/rundeck /var/lib/rundeck/var/storage /var/lib/rundeck/logs ; do
    filename=$(echo ${directory} | sed 's%/%%g').tar.gz
    cat data/${filename} | docker exec -i rundeck /bin/bash -c "cat > ${dirname}/${filename}"
    docker exec rundeck tar -xzf ${dirname}/${filename} -C ${directory}
  done
  if [ $? = 0 ] ; then
    echo "Okay."
  else
    echo "Failed."
  fi
}

restoredatabase
restorefiles
