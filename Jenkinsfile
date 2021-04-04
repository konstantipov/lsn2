pipeline {
  environment {
    imagename = "konstantipov/jenkins"
    registryCredential = 'dockerhub_id'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git([url: 'https://github.com/konstantipov/lsn2.git',branch: 'main'])
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = sudo docker.build imagename
        }
      }
    }
    stage('Push Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
//            dockerImage.push("$BUILD_NUMBER")
             dockerImage.push('latest')

          }
        }
      }
    }
    stage('Deploy') {
      steps{
        sh "docker run --rm -d -p80:8080 konstantipov/jenkins:latest"
        sh "date"

      }
    }
  }
}
