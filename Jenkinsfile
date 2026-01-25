pipeline {
  agent {label 'docker'}
  
  stages {
    stage('Build & Deploy') {
      steps {
        sh 'chmod +x scripts/build_run.sh'
        sh 'scripts/build_run.sh'
      }
    }

    stage('Verify') {
      steps {
        sh 'docker ps | grep nginx-container'
      }
    }
    
  }

}
