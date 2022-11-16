FROM registry.redhat.io/ubi8/openjdk-8

MAINTAINER Giovanni Astarita

USER root

COPY src /home/app/src
COPY pom.xml /home/app

RUN mvn -f /home/app/pom.xml clean package

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/home/app/target/spring-boot-hello-world-fe-0.0.1-SNAPSHOT.jar"]
