# Use a stable Alpine Linux base image
FROM alpine:3.19

# Install dependencies and OpenJDK 8
RUN apk update && \
    apk add --no-cache openjdk8-jre=8.392.08-r0 && \
    rm -rf /var/cache/apk/*

# Set the JAVA_HOME environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk \
    PATH=$PATH:$JAVA_HOME/bin

# Set working directory inside the container
WORKDIR /app

# Copy the built JAR file into the container
COPY target/*.jar app.jar

# Expose the port your Spring Boot app uses
EXPOSE 8080

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
