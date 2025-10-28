FROM eclipse-temurin:21-jre

WORKDIR /app

COPY build/libs/api.jar app.jar

ENV SPRING_PROFILES_ACTIVE=prod

ENTRYPOINT ["java", "-jar", "app.jar"]
