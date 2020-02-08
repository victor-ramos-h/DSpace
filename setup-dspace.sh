docker-compose -p d6 stop
echo "Construyendo DSpace. Esto puede tardar unos minutos dependiendo de su computadora"
docker-compose -f docker-compose.yml -f docker-compose-cli.yml build
echo "Iniciando la base de datos"
docker-compose -p d6 up -d dspacedb
sleep 5
echo "Creando usuario por defecto"
docker-compose -p d6 -f docker-compose-cli.yml run dspace-cli create-administrator -e admin@adp.edu -f admin -l user -p admin -c es
echo "DSpace construido correctamente."
echo "Usuario: admin@adp.edu"
echo "Password: admin"
echo "Ahora ejecuta: ./start-dspace.sh"
