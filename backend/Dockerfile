# Build stage
FROM eclipse-temurin:25-jdk AS builder
WORKDIR /app
COPY gradle gradle
COPY gradlew gradlew.bat settings.gradle build.gradle ./
RUN ./gradlew build -x test --no-daemon

# Runtime stage
FROM eclipse-temurin:25-jre
WORKDIR /app
COPY --from=builder /app/build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
