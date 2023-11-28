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
      // Update existing plugins before installing new ones
      sh 'jenkins-cli plugins -update'

      // Install missing plugins manually, handling specific error cases
      sh '''
        jenkins-cli plugins -install ssh-slaves antisamy-markup-formatter workflow-api

        # Install instance-identity-provider, skipping if plugin is already installed
        jenkins-cli plugins -install instance-identity-provider || echo "Instance Identity Provider Plugin already installed"

        # Install ldap, handling dependency update
        jenkins-cli plugins -install ldap && jenkins-cli plugins -update ldap

        # Install timestamper, handling dependency updates
        jenkins-cli plugins -install timestamper && jenkins-cli plugins -update timestamper

        # Install pipeline-rest-api, handling Jenkins version incompatibility
        jenkins-cli plugins -install pipeline-rest-api || echo "Pipeline: REST API Plugin requires Jenkins 2.361 or higher"

        # Install pipeline-stage-view, handling dependency on pipeline-rest-api
        jenkins-cli plugins -install pipeline-stage-view || echo "Pipeline: Stage View Plugin requires Pipeline: REST API Plugin to be installed"
      '''

      // Restart Jenkins to apply plugin changes
      sh 'service jenkins restart'
    }
  }
}
