pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('Docker') // Add Docker Hub credentials in Jenkins
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', credentialsId: 'Github_credentials', url: 'https://github.com/darshanpawar47/Two-Tier-bank.git'
            }
        }
	 stage('Build Application') {
    steps {
        sh 'mvn clean package'
    }
}
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t darshanpawar47/bankapp:latest .'
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
		sh 'docker ps -q -f name=bankapp-conatiner && docker stop bankapp-container && docker rm bankapp-container || echo "Container not found or already stopped."'
		sh 'docker run -d -p 8082:8082 --name bankapp-container darshanpawar47/bankapp:latest'
		 
            }
        }
    }
}
