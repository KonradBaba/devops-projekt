pipeline {
    agent any

    environment {
        // Zdefiniuj unikalną nazwę obrazu, aby uniknąć konfliktów
        DOCKER_IMAGE_NAME = "konrad/flask-app:${env.BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                // Pobranie kodu z repozytorium
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Budowanie obrazu Docker na podstawie Dockerfile w repozytorium
                    echo "Building Docker image: ${DOCKER_IMAGE_NAME}"
                    docker.build(DOCKER_IMAGE_NAME, '.')
                }
            }
        }

        stage('Deploy to K3s') {
            steps {
                script {
                    // Zastosowanie manifestów Kubernetes (deployment i service)
                    // Pliki te muszą znajdować się w Twoim repozytorium
                    echo "Deploying to K3s..."
                    sh 'kubectl apply -f deployment.yaml'
                    sh 'kubectl apply -f service.yaml'
                }
            }
        }
        
        stage('Cleanup') {
            steps {
                // Sprzątanie starych obrazów Docker, aby nie zapełnić dysku
                sh "docker rmi ${DOCKER_IMAGE_NAME}"
            }
        }
    }
}
