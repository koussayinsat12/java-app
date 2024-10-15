FROM registry.access.redhat.com/ubi8/ubi-minimal:8.5

LABEL BASE_IMAGE="registry.access.redhat.com/ubi8/ubi-minimal:8.5"
LABEL JAVA_VERSION="11"

# Install OpenJDK 11
RUN microdnf install --nodocs java-11-openjdk-headless && microdnf clean all

# Set working directory
WORKDIR /work/

# Copy the JAR file to the container
COPY target/*.jar /work/application.jar

# Expose port 8080
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "application.jar"]

