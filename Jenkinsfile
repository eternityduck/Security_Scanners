pipeline {
  agent {
    kubernetes {
      yaml '''
apiVersion: v1
kind: Pod
metadata:
  name: checkov
spec:
  containers:
  - name: checkov
    image: bridgecrew/checkov:2.0.888
    command:
    - cat
    tty: true
'''   
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
