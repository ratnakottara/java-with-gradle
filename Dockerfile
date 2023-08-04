# Step 1: Choose a base image with the appropriate Java version
FROM openjdk:11

# Step 2: Set the working directory inside the container
WORKDIR /usr/app

# Step 3: Copy the Gradle build files
COPY build.gradle settings.gradle gradlew /usr/app/
COPY gradle /usr/app/gradle
COPY src /usr/app/src

# Step 4: Run the Gradle build to create the application JAR
RUN ./gradlew build

# Step 5: Set the entry point to run the Java application
ENTRYPOINT ["java", "-jar","usr/app/build/libs/my-app-1.0-SNAPSHOT.jar"]
