# Migration Service

The **Migration Service** manages the database schema for the application by creating and updating tables using **Flyway**. It connects to a PostgreSQL database and provides monitoring capabilities through **Spring Boot Actuator**.

**Note**

## Table of Contents
- [Overview](#overview)
- [Supported Profiles](#supported-profiles)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Actuator Monitoring](#actuator-monitoring)
- [Database Migrations](#database-migrations)
- [CI/CD Integration](#cicd-integration)
- [Security](#security)
- [Contributing](#contributing)
- [License](#license)

**Note**

## Overview

The Migration Service is responsible for:
- Connecting to a PostgreSQL database.
- Applying database migrations to create and maintain the required table structure.
- Exposing Actuator endpoints for service monitoring.

### Supported Profiles

The service supports the following profiles, defined in `application.yml`:
- `postgres`: Sets up the PostgreSQL database connection.
- `flyway`: Configures Flyway for database migrations.
- `actuator`: Enables Spring Boot Actuator for monitoring.

**Note**

## Features

- **Flyway Integration**: Automates database schema migrations.
- **PostgreSQL Support**: Connects to a PostgreSQL database.
- **Actuator Monitoring**: Provides endpoints for health checks and metrics.
- **Profile-Based Configuration**: Uses profiles for flexible setup across environments.

**Note**

## Prerequisites

To run the service, ensure you have:
- Java 21 or higher
- Spring Boot 3.4.x
- Access to a PostgreSQL database
- Gradle for dependency management

**Note**

## Setup

Follow these steps to set up and run the service:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/pxdkxvan/telegram-upload-bot-migration.git
   ```

2. **Configure the following variables in a `.env` file**:
   - `MIGRATION_NAME`: Unique name for the Migration Service.
   - `MIGRATION_PORT`: Port for the Migration Service.
   - `APPLICATION_PROTOCOL`: The protocol (http or https).
   - `CONFIG_HOST`: Domain or IP for the Config Service (e.g., `config`).
   - `CONFIG_PORT`: Port for the Config Service (e.g., `8888`).
   - `POSTGRES_HOST`: Domain or IP for PostgreSQL (e.g., `postgres`).
   - `POSTGRES_PORT`: PostgreSQL port (e.g., `5432`).
   - `POSTGRES_USER`: Username for the PostgreSQL database connection (e.g., `postgres`).
   - `POSTGRES_PASSWORD`: Password for the PostgreSQL database connection (e.g., `mysecretpassword`).
   - `FLYWAY_LOCATIONS`: Path to Flyway migration scripts (e.g., `classpath:db/migration`).
   - `ACTUATOR_ENDPOINT`: Base path for Actuator endpoints (e.g., `/actuator`).

3. **Build the Project**:
   ```bash
   ./gradlew build
   ```

4. **Run the Service**:
   ```bash
   ./gradlew bootRun
   ```

**Note**

## Database Migrations

- The service automatically applies pending migrations on startup with the `flyway` profile.
- Migration scripts are stored in `src/main/resources/db/migration` as SQL files, but you can customize the locations through the `FLYWAY_LOCATIONS` variable
- Flyway tracks applied migrations in the `flyway_schema_history` table.

### Adding New Migrations

1. Create a new migration file in path specified in `FLYWAY_LOCATIONS`.
2. Name it following Flyway's versioning convention, e.g., `V<num>__<operation>.sql`.
3. The service will apply the migration on the next startup.

**Note**

## Actuator Monitoring

The service exposes the following Actuator endpoints for monitoring:
- `/actuator/health`: Checks the service and database connection status.
- `/actuator/info`: Provides service information.
- `/actuator/metrics`: Displays performance and system metrics.
- `/actuator/loggers`: Allows viewing and managing logging levels.

**Note**

## CI/CD Integration

The service can be integrated into a CI/CD pipeline to apply migrations automatically during deployment:
- Include the service startup in your deployment scripts.
- Ensure migrations are applied before other services start.

**Note**

## Security

- Protect database credentials using environment variables or a secrets manager.
- Restrict access to Actuator endpoints with Spring Security if needed.

**Note**

## Contributing

Contributions are welcome! Please submit a pull request or open an issue to discuss ideas or fixes.

**Note**

## License

This project is licensed under the [MIT License](LICENSE).