pipeline {
  agent { label 'linux'}
  options {
    skipDefaultCheckout(true)
  }
  stages {
    stage('clean workspace') {
      steps {
        cleanWs()
      }
    }
    stage('checkout') {
      steps {
        checkout scm
      }
    }
    
    stage('checkov') {
     agent{ 
      docker {
        image 'bridgecrew/checkov:2.0.888'
        reuseNode true
      }
     } 
      steps {
          sh '''
          checkov --version
          checkov -d non-compliant
          '''
      }
    }
  }
  post {
    always {
      cleanWs()
    }
  }
}
