FROM openjdk:11

# Step 1: Set the working directory inside the container
WORKDIR /usr/app

# Step 2: Copy the Gradle build files and source code
COPY build.gradle settings.gradle gradlew /usr/app/
COPY gradle /usr/app/gradle
COPY src /usr/app/src

# Step 3: Run the Gradle build to create the application JAR
RUN ./gradlew build

# Step 4: Set the entry point to run the Java application
ENTRYPOINT ["java", "-jar", "/usr/app/build/libs/my-app-1.0-SNAPSHOT.jar"]
