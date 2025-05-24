pipeline {
  agent any

  environment {
    DOCKER_HUB_CREDENTIALS = credentials('dockerhub-creds')
    IMAGE_NAME = "govindraj11/appointment"
  }

  stages {
    stage('Clone Repository') {
      steps {
        git url: 'https://github.com/govindraj11/appointment.git', branch: 'main'
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          dockerImage = docker.build("${IMAGE_NAME}")
        }
      }
    }

    stage('Push to Docker Hub') {
      steps {
        script {
          docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-creds') {
            dockerImage.push("latest")
          }
        }
      }
    }
  }

  post {
    success {
      echo '✅ Build and push successful!'
    }
    failure {
      echo '❌ Build failed.'
    }
  }
}