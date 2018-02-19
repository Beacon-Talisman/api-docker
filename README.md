# api-docker
Docker for everything nmeeded for API

ony the api bit works currently

URL for roweb dev server: http://vencuro-api.dock.roweb.ro/api/dev16/

to use:
cd api
then run:-
build.sh  # build the image including database 
run.sh    # to start mage in a container
login.sh  # to log you into the container as root in a bash session

The first time you login and any tiem you need to reset the database
run :-
setup_database.sh

To start and stop the api use

start-talapi.sh
stop-talapi.sh
restart-talapi.sh

point your browser at  http://<hostname>:3000/api/dev16

NOTE: /api/dev16 is specified bt the setting of prefix in lib/TalApi.pm
NOTE2: your DOCKER_ENVIRONMENT is set to docker so your setup is defined in environments/docker.yml

Log files are created in the subdirectory logs

server.log is the initial log and wil contasin details if anything craches without handling the error
<environment>.logcontains everything out by debug or error statements from the main Dancer module lib/TalApi.pm
i.e. docker.log 
api.log contains log messages produced by the MyAPI object (lib/MyAPI.pm and lib/MyAPI/Methods.pm)
sql_api.log contains log messages produced by the SQL Query object lib/MyAPI/SQLQuery.pm

On restart, previous log files are zipped up and fresh ones are created
