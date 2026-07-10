# Blog Post Server

This is the Java (Spring Boot) microservice responsible for managing blog posts.

## Configuration
Configuration is managed via `application.properties` and `.env`. 
Ensure you have a `.env` file at the root with at least the following:
```env
SERVER_PORT=8081
```

## Running Locally
To run the server locally without Docker, use the Maven wrapper:
```bash
# First time setup (if wrapper is missing):
# mvn wrapper:wrapper

./mvnw spring-boot:run
```
*(Note: If you run into database connection errors, ensure your PostgreSQL database is running and configured, or use an in-memory database like H2 during development).*
