
az configure --defaults group=spcdemo
az configure --defaults spring-cloud=spcdemo

curl https://start.spring.io/starter.tgz -d dependencies=web,cloud-eureka,cloud-config-client -d baseDir=spring-cloud-microservice -d bootVersion=2.3.8 -d javaVersion=1.8 | tar -xzvf -

./mvnw spring-boot:run &
mvnw spring-boot:run 

az spring-cloud app create -n spcsvc

./mvnw clean package -DskipTests
az spring-cloud app deploy -n spcsvc --jar-path target/demo-0.0.1-SNAPSHOT.jar --env SPRING_PROFILES_ACTIVE=app


az spring-cloud app logs --name spcsvc -f

#Rade China Account
az cloud set -n AzureChinaCloud
az account set -s 1cd43d46-3556-433e-a94e-c28594e17bee


az spring-cloud app create -n spcsvc -g spcdmo -s spcemo 

mvnw clean package -DskipTests
az spring-cloud app deploy -n spcsvc -g spcdmo -s spcemo --jar-path target/demo-0.0.1-SNAPSHOT.jar --env SPRING_PROFILES_ACTIVE=testMicro LOGGING_LEVEL_ORG_SPRINGFRAMEWORK_WEB=TRACE

az spring-cloud app deploy -n goods -g spcdmo -s spcemo --jar-path goods-rade-2.jar --env SPRING_PROFILES_ACTIVE=testMicro LOGGING_LEVEL_ORG_SPRINGFRAMEWORK_WEB=TRACE

az spring-cloud app logs -f -n spcsvc --lines 1000 -g spcdmo -s spcemo 

curl https://primary:uQvS6b4b3r1pyMZNbQosurMw2g2cNFrdoDWKBhrPGPnPbw1UeKusELso6SkNGEfu@spcemo.test.microservices.azure.cn/spcsvc/default/hello