FROM openjdk:21
EXPOSE 8989
ADD target/devops-automation-integration.jar devops-automation-integration.jar
ENTRYPOINT ["java","-jar","devops-automation-integration.jar"]