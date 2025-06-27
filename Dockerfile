# Use a minimal OpenJDK base image
FROM eclipse-temurin:17-jdk-alpine

# Set working directory inside the container
WORKDIR /app

# Copy the jar file from build context to the container
# (replace 'app.jar' with your actual JAR name if needed)
COPY target/*.jar app.jar

# Expose default Spring Boot port
EXPOSE 8080

# Run the Spring Boot app
ENTRYPOINT ["java", "-jar", "app.jar"]
