FROM eclipse-temurin:17-jdk-alpine
MAINTAINER sneakydog@yeah.net
ENV env=default
RUN mkdir -p "/home/app"
RUN mkdir -p "/home/app/conf"
WORKDIR "/home/app"
COPY ./*.jar "/home/app/app.jar"
RUN ls "/home/app"
COPY ./conf/*.yml "/home/app/conf/"
RUN ls "/home/app/conf/"
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/home/app/app.jar", "--spring.config.additional-location=/home/app/conf/", "--spring.profiles.active=${env}"]
