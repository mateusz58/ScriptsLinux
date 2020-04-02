
printf "Please provide type of action you want to execute: \nrun  - execute keycloak \nExport export keycloak configuration to file \nimport - import keycloak configuration from file"

read action


run () {
docker run -e KEYCLOAK_USER=admin  KEYCLOAK_PASSWORD=admin -e DB_ADDR=localhost:5432 -e  DB_VENDOR=postgres -e DB_DATABASE:Testing  keycloak -p 8081:8081 --name dockerKeyCloak jboss/keycloak
}

Export () {
docker exec -it kc keycloak/bin/standalone.sh \
-Djboss.socket.binding.port-offset=100 -Dkeycloak.migration.action=export \
-Dkeycloak.migration.provider=singleFile \
-Dkeycloak.migration.realmName=master \
-Dkeycloak.migration.usersExportStrategy=REALM_FILE \
-Dkeycloak.migration.file=/tmp/master.json
}

import() {
docker run -e KEYCLOAK_USER=<USERNAME> -e KEYCLOAK_PASSWORD=<PASSWORD> \
    -e KEYCLOAK_IMPORT=/tmp/master.json -v /tmp/master.json:/tmp/master.json jboss/keycloak
}

$action

