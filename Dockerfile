FROM maven:3.5.4-jdk-8-alpine as maven
COPY ./pom.xml ./pom.xml
COPY ./src ./src
RUN mvn dependency:go-offline -B
RUN mvn package
FROM openjdk:8u171-jre-alpine
WORKDIR /joshva0
COPY --from=maven target/gs-maven*.jar ./joshva0/java-pipeline--p.jar
CMD ["java", "-jar", "./joshva0/java-pipeline--p.jar"]
