pipeline{
    agent any
    tools {
        maven '3.8.5'
    }
    stages{
        stage("Build Maven"){
            steps{
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/shekhartn/devops-automation']])
                sh "mvn clean install"
            }
        }
        stage("Build Docker Image"){
            steps{
                script{
                sh 'docker build -t shekhart/devops-automation-integration .'
            }
          }
        }
        stage("Push Docker Image To Hub"){
            steps{
                script{
                withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u shekhart -p ${dockerhubpwd}'
                }
                sh 'docker push shekhart/devops-automation-integration'
            }
          }
        }

    }
}