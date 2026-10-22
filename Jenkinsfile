pipeline {
    agent any
    tools { nodejs 'Node20' }
    environment {
        DOCKERHUB_USER       = 'sivavenkatasubramaniyan'
        IMAGE_TAG            = "${BUILD_NUMBER}"
        COMPOSE_PROJECT_NAME = 'stms-pipeline'
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'git-creds',
                    url: 'https://github.com/sivasubramaniyan8438/smart-task-devops.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                sh '''
                for svc in frontend auth-service task-service notification-service report-service api-gateway; do
                  (cd $svc && npm install)
                done
                '''
            }
        }
        stage('Build Docker Images') {
            steps { sh 'docker compose build' }
        }
        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds',
                                 usernameVariable: 'DH_USER', passwordVariable: 'DH_TOKEN')]) {
                    sh '''
                    echo "$DH_TOKEN" | docker login -u "$DH_USER" --password-stdin
                    for svc in frontend api-gateway auth-service task-service notification-service report-service; do
                      docker tag stms-pipeline-$svc:latest $DOCKERHUB_USER/stms-$svc:$IMAGE_TAG
                      docker push $DOCKERHUB_USER/stms-$svc:$IMAGE_TAG
                    done
                    docker logout
                    '''
                }
            }
        }
    }
}