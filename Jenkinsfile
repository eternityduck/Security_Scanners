pipeline {
  agent {
    docker {
      image 'bridgecrew/checkov:2.0.888'
      reuseNode true
    }
  }
  stages {
    stage('verify version') {
      steps {
        container('checkov') {
          sh 'checkov --version'
        }
      }
    }
    stage('analyze non-compliant') {
      steps {
        container('checkov') {
          sh 'checkov -d non-compliant'
        }
      }
    }
  }
}
