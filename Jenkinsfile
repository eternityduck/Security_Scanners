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

    stage('pre-commit') {
      steps {
          sh '''
          docker run -v $(pwd):/lint -w /lint ghcr.io/antonbabenko/pre-commit-terraform:latest run -a
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
