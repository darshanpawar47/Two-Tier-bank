pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('Docker') // Add Docker Hub credentials in Jenkins
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', credentialsId: 'Github-credentials', url: 'https://github.com/darshanpawar47/Two-Tier-bank.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t darshanpawar47/bankapp:latest ./app'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                sh 'docker push darshanpawar47/bankapp:latest'
            }
        }
        stage('Deploy Application') {
            steps {
                sh 'docker-compose -f docker-compose.yml down'
                sh 'docker-compose -f docker-compose.yml up -d'
            }
        }
    }
}