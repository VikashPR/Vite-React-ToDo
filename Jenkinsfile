pipeline {
    agent {
    docker {
        image 'docker:dind'
        args '--privileged --entrypoint=""'
        reuseNode true
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
