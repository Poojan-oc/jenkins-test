pipeline {
    agent any

    environment {
        IMAGE_NAME = "react-frontend"
        CONTAINER_NAME = "react-frontend"
        APP_PORT = "3000" // React app port
    }

    stages {
        stage('Checkout Code') {
            steps {
                echo 'Pulling code from Git repository...'
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building the Docker image...'
                sh """
                docker build -t ${IMAGE_NAME} .
                """
            }
        }

        stage('Run Docker Container') {
            steps {
                echo 'Running the Docker container...'
                sh """
                docker stop ${CONTAINER_NAME} || true
                docker rm ${CONTAINER_NAME} || true
                docker run -d --name ${CONTAINER_NAME} -p ${APP_PORT}:${APP_PORT} ${IMAGE_NAME}
                """
            }
        }
    }

    post {
        always {
            echo 'Cleaning up old containers...'
            sh """
            docker stop ${CONTAINER_NAME} || true
            docker rm ${CONTAINER_NAME} || true
            """
        }
        success {
            echo 'Pipeline executed successfully. React app is running on port ${APP_PORT}.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
