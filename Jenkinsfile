pipeline {
    agent {
        docker {
            image 'node:6-alpine'
            args '-p 3000:3000'
            // Use the Docker daemon provided by Docker Desktop
            url 'tcp://localhost:2376'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
    }
}
