pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'echo "Compiling source code..."'
            }
        }
        stage('Test') {
            steps {
                sh './hello-world.sh'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying the application...'
            }
        }
    }
}
