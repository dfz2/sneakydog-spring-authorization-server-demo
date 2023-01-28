FROM eclipse-temurin:17-jdk-alpine
ENV ENV=default
ADD ./application/*.jar /data/app.jar
ENTRYPOINT ["java", "-jar","/data/app.jar", "--spring.config.additional-location=optional:/data/conf/", "--spring.profiles.active=${ENV}"]