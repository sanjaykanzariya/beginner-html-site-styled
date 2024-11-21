pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'sanjaykanzariya/beginner-html-site-styled'
        DOCKER_CREDENTIALS_ID = 'bcb686c1-248a-44b3-97c1-5a883dbf2ddc'
        KUBE_CONFIG = '/etc/kubernetes/admin.conf'
    }
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/sanjaykanzariya/beginner-html-site-styled.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'sudo docker build -t $DOCKER_IMAGE .'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS_ID, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh "sudo docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"
                        sh "sudo docker push $DOCKER_IMAGE"
                    }
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh 'kubectl apply -f deployment.yaml -f service.yaml --kubeconfig=$KUBE_CONFIG'
                }
            }
        }
    }
    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
