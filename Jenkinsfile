pipeline {
  agent { label 'linux'}
  options {
    skipDefaultCheckout(true)
  }
  stages{
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
    stage('tfsec') {
      agent {
        docker { 
          image 'tfsec/tfsec-ci:v0.57.1' 
          reuseNode true
        }
      }
    }
  }
  post {
    always {
      cleanWs()
    }
  }
}
