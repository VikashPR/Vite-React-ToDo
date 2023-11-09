pipeline {
  agent {
    docker {
      image 'node:14-alpine'
      args '-p 3000:3000'
    }
  }

  stages {
    stage('Build') {
      steps {
        sh 'npm install'
        sh 'npm run build'
      }
    }

    stage('Test') {
      steps {
        sh 'npm run test'
      }
    }

    stage('Package') {
      steps {
        sh 'docker build -t myapp .'
      }
    }

    stage('Deploy') {
      steps {
        sh 'docker run -p 80:3000 -d myapp'
      }
    }
  }

  postBuild {
    steps {
      // Update plugins before attempting to install new ones
      sh 'jenkins-cli plugins -update'

      // Install missing plugins manually
      sh 'jenkins-cli plugins -install ssh-slaves antisamy-markup-formatter workflow-api instance-identity-provider'

      // Try reinstalling previously failed plugins
      sh 'jenkins-cli plugins -install ldap timestamper pipeline-rest-api pipeline-stage-view'

      // Restart Jenkins to apply plugin changes
      sh 'service jenkins restart'
    }
  }
}
