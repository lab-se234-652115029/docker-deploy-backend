FROM openjdk:16-jdk-alpine
RUN addgroup -S spring && adduser -S spring -G spring
EXPOSE 8080

ENV JAVA_PROFILE prod
ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/BOOT-INF/classes /app
COPY ${DEPENDENCY}/META-INF /app/META-INF

ENTRYPOINT ["java", "-Dspring.profiles.active=${JAVA_PROFILE}", "-cp", "app:app/lib/*", "camt.se234.lab10.Lab10Application"]
