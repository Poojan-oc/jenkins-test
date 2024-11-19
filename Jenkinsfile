pipeline {
    agent any

    environment {
        IMAGE_NAME = 'html-frontend'
        CONTAINER_NAME = 'html-frontend-container'
        HOST_PORT = '8081' // Host port for the application
    }

    stages {
        stage('Checkout Code') {
            steps {
                echo 'Pulling code from Git...'
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh """
                docker build -t ${IMAGE_NAME} .
                """
            }
        }

        stage('Run Docker Container') {
            steps {
                echo 'Running Docker container...'
                sh """
                docker run -d --name ${CONTAINER_NAME} -p ${HOST_PORT}:80 ${IMAGE_NAME}
                """
            }
        }
    }

    post {
        always {
            echo 'Cleaning up previous containers...'
            sh """
            docker stop ${CONTAINER_NAME} || true
            docker rm ${CONTAINER_NAME} || true
            """
        }
        success {
            echo 'Frontend app deployed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check logs for errors.'
        }
    }
}
