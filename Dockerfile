FROM maven:3-openjdk-17

WORKDIR /app

COPY . .

RUN mvn clean install

ENTRYPOINT mvn test