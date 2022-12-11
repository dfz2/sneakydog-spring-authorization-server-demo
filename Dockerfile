FROM eclipse-temurin:17-jdk-alpine
VOLUME /tmp
ENV env=default
COPY target/sneakydog-spring-authorization-server-demo-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar", "--spring.profiles.active=${env}"]
