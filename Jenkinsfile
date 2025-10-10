pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo 'Rozpoczynam budowanie obrazu Docker...'
                    def imageName = "moja-super-apka:${env.BUILD_NUMBER}"
                    docker.build(imageName)
                    echo "Pomyślnie zbudowano obraz: ${imageName}"
                }
            }
        }

        // NOWY ETAP - WDRAŻANIE NA K3S
        stage('Deploy to K3s') {
            steps {
                script {
                    echo 'Rozpoczynam wdrażanie na K3s...'
                    // Używamy komendy, której użyliśmy wcześniej ręcznie
                    sh 'sudo k3s kubectl apply -f deployment.yaml'
                    echo 'Pomyślnie wdrożono nową wersję!'
                }
            }
        }
    }
}  
