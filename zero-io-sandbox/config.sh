#!/usr/bin/bash

network=$1
mysqlurl=$2
database=$3

if [ ! $database ];then
    echo 'Usage: io-config.sh <network> <mysqlurl> <database>'
    echo 'Option:'
    echo '      network   - docker network name you want to connect'
    echo '      mysqlurl  - mysql server url'
    echo '      database  - database name'
    exit
fi

#cat $webapps/io-api/config/application.yml

## cp io.conf to sandbox gateway
get_nginx_container() {
   docker network inspect $network  --format '{{range .Containers}}{{$name := .Name}}{{println $name}}{{end}}' | grep nginx
}

gateway_container=$(get_nginx_container)

get_nginx_confd_path() {
   docker inspect $gateway_container --format '{{range .Mounts}}{{$path := .Source}}{{println $path}}{{end}}' | grep conf.d
}

gateway_confd=$(get_nginx_confd_path)

## copy sandbox.d/*.conf to $gateway_confd/sandbox.d
if [ -d sandbox.d ];then
  echo "cp sandbox.d/*.conf $gateway_confd/sandbox.d"
  if [ ! -d  $gateway_confd/sandbox.d ];then mkdir $gateway_confd/sandbox.d fi
  cp sandbox.d/*.conf $gateway_confd/sandbox.d
fi
## end sandbox.d/*.config

# config docker network
if [ -f docker-compose.yml ];then
  sed -i "s/name:[[:space:]]*\${network}/name: $network/" docker-compose.yml
else
  echo docker-compose.yml not found!
fi


#
# config mysql url and dbname
# 

## cp io.conf to sandbox gateway
get_api_container() {
   docker network inspect $network  --format '{{range .Containers}}{{$name := .Name}}{{println $name}}{{end}}' | grep api
}

api_container=$(get_api_container)

get_api_path() {
   docker inspect $api_container --format '{{range .Mounts}}{{$path := .Source}}{{if eq .Destination "/webapps"}}{{println $path}}{{end}}{{end}}'
}

api_config=$(get_api_path)/config


## get mysql url from api_config
application_yml='io-api/config/application.yml'
mysqlurl=$(sed -n 's/.*jdbc:mysql:\/\/\([a-zA-Z0-9:-\.]*\).*/\1/p' $application_yml)
database=$(sed -n 's/.*jdbc:mysql:.*\/\([a-z_-]*\)?.*/\1/p' $application_yml)
mysql_user=$(sed -n 's/.*username:[[:space:]]*\(.*\)/\1/p' $application_yml)
mysql_pw=$(sed -n 's/.*password:[[:space:]]*\(.*\)/\1/p' $application_yml)

if [ -f $application_yml ];then
  #sed -i "s/jdbc:mysql:\/\/mysqlserver:3306\/[a-zA-Z\.]*?/jdbc:mysql:\/\/$mysqlurl\/$database?/" $application_yml
  sed -i "s/jdbc:mysql:\/\/[a-z0-9:_-]*\/[a-z_-]*?/jdbc:mysql:\/\/$mysqlurl\/$database?/" $application_yml

  ## replace username and password
  sed -i "s/username:[[:space:]]*[a-z_-]*/username: $mysql_user/" $application_yml
  sed -i "s/password:[[:space:]]*[a-z_-]*/username: $mysql_pw/" $application_yml

else
  echo application.yml not found!
fi


## start zero-io docker
#echo 'docker-compose up ...'
#docker-compose -f docker-compose.yml up




