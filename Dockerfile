# Use Alpine Linux as the base image
FROM alpine:3.19 # Specify a recent and stable Alpine version

# Update package lists and upgrade existing packages
RUN apk update && apk upgrade

# Install OpenJDK 8 JRE (Java Runtime Environment)
# For development, you might need 'openjdk8-jdk' for the full JDK
RUN apk add openjdk8=8.252.09-r0 # Pin to a specific version for reproducibility

# Set the JAVA_HOME environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk

# Set working directory inside the container
WORKDIR /app

# Copy the jar file from build context to the container
# (replace 'app.jar' with your actual JAR name if needed)
COPY target/*.jar app.jar

# Expose default Spring Boot port
EXPOSE 8080

# Run the Spring Boot app
ENTRYPOINT ["java", "-jar", "app.jar"]
