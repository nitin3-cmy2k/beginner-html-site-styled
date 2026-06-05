pipeline {
    agent { label 'slave1' }

    environment {
        APP_NAME        = "nginx"
        CONTAINER_NAME = "nginx"
        APP_PORT        = "80"
        HOST_PORT       = "82"
        IMAGE_TAG       = "${env.BUILD_NUMBER}"
        APP_VERSION     = "v${env.BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                sudo docker build -t ${APP_NAME}:${IMAGE_TAG} .
                sudo docker tag ${APP_NAME}:${IMAGE_TAG} ${APP_NAME}:latest
                '''
            }
        }

        stage('Deploy on Agent (Docker Run)') {
            steps {
                sh '''
                set +e
                sudo docker rm -f ${CONTAINER_NAME} >/dev/null 2>&1
                set -e

                sudo docker run -d \
                    --name ${CONTAINER_NAME} \
                    -p ${HOST_PORT}:${APP_PORT} \
                    -e APP_VERSION=${APP_VERSION} \
                    ${APP_NAME}:latest

                sudo docker ps | grep ${CONTAINER_NAME}
                '''
            }
        }

        stage('Smoke Test') {
            steps {
                sh '''
                sleep 3
                sudo curl -s http://localhost:${HOST_PORT}/ | head -n 1
                '''
            }
        }
    }
}
