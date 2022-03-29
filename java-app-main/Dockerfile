FROM maven:3.5.4-jdk-8-alpine as maven
COPY ./pom.xml ./pom.xml
COPY ./src ./src
RUN mvn dependency:go-offline -B
RUN mvn package
FROM openjdk:8u171-jre-alpine
WORKDIR /java-pipeline--p
COPY --from=maven target/SimpleJavaProject-*.jar ./java-pipeline--p/java-app.jar
CMD ["java", "-jar", "./java-pipeline--p/java-app.jar"]
