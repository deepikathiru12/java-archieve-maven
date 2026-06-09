FROM maven:3.9.6-eclipse-temurin-17 AS stage

WORKDIR /data

COPY . .

RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre

COPY --from=stage /data/target/*.jar app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]
