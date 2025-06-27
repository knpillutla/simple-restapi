# Use OpenJDK 8 JRE on Alpine as base image
FROM openjdk:8-jre-alpine

# Set working directory inside container
WORKDIR /app

# Copy the Spring Boot fat jar into container
COPY target/*.jar app.jar

# Expose default Spring Boot port
EXPOSE 8080

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
