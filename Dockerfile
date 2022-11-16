FROM registry.redhat.io/ubi8/openjdk-8

MAINTAINER Giovanni Astarita

USER root

#COPY target/spring-boot-hello-world-0.0.1-SNAPSHOT.jar /tmp/spring-boot-hello-world-0.0.1-SNAPSHOT.jar

COPY src /home/app/src
COPY pom.xml /home/app

RUN mkdir -p /var/local/SP
RUN mvn -f /home/app/pom.xml clean package
#RUN touch /var/local/SP/timestamp.properties

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/home/app/target/spring-boot-hello-world-0.0.1-SNAPSHOT.jar"]
#ENTRYPOINT ["java", "-jar", "/tmp/spring-boot-hello-world-0.0.1-SNAPSHOT.jar"]
