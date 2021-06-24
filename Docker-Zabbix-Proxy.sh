#!/bin/bash
#Script gerado por Oscar Santos em nome da K3G Solutions.

#Atualizar e instalar o Docker
apt-get update -y
apt-get install docker.io -y

#Baixar o container oficial com a mesma versao do nosso server
docker pull zabbix/zabbix-proxy-mysql:alpine-5.0-latest

#Executar o docker com o apontamento para o nosso servidor
docker run --name zabbix-proxy-mysql -e DB_SERVER_HOST=endereço -e MYSQL_USER=user -e MYSQL_PASSWORD=Senha -e ZBX_HOSTNAME=zbx-prx-cliente -e ZBX_SERVER_HOST=domínio -d zabbix/zabbix-proxy-mysql:alpine-5.0-latest

#Rotina para inciar o container sempre com o servidor
docker update --restart always zabbix-proxy-mysql
