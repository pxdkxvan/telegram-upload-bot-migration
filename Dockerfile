FROM gradle:8.13-jdk21 AS builder

WORKDIR /app

COPY build.gradle settings.gradle /app/
COPY src /app/src

RUN gradle build --no-daemon -x test

FROM eclipse-temurin:21-jre

WORKDIR /app
COPY --from=builder /app/build/libs/migration-1.0.jar /app/migration.jar
EXPOSE 8080

ENV MIGRATION_NAME=""
ENV MIGRATION_PORT=""
ENV APPLICATION_PROTOCOL=""
ENV CONFIG_HOST=""
ENV CONFIG_PORT=""
ENV POSTGRES_HOST=""
ENV POSTGRES_PORT=""
ENV POSTGRES_USER=""
ENV POSTGRES_PASSWORD=""
ENV FLYWAY_LOCATIONS=""
ENV ACTUATOR_ENDPOINT=""

ENTRYPOINT ["java", "-jar", "migration.jar"]