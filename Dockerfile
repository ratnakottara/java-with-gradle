FROM openjdk:11

# Set the working directory inside the container
WORKDIR /usr/app

# Copy the Gradle build files and source code
COPY build.gradle settings.gradle gradlew /usr/app/
COPY gradle /usr/app/gradle
COPY src /usr/app/src

# Run the Gradle build to create the application JAR
RUN ./gradlew build

# Copy the JAR file into the container
COPY build/libs/my-app-1.0-SNAPSHOT.jar /usr/app/build/libs/my-app-1.0-SNAPSHOT.jar

# Set the entry point to run the Java application
ENTRYPOINT ["java", "-jar", "/usr/app/my-app-1.0-SNAPSHOT.jar"]
