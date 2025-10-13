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
                    echo "Aktualizuję plik wdrożenia nowym tagiem: ${env.BUILD_NUMBER}"
                sh "sed -i 's|image: moja-super-apka:.*|image: moja-super-apka:${env.BUILD_NUMBER}|' deployment.yaml"

                echo "Wdrażam nową wersję I WYMUSZAM RESTART PODÓW..."
                // TO JEST KLUCZOWA ZMIANA: Najpierw wgrywamy zmiany, A POTEM rozkazujemy zrestartować deployment.
                sh 'k3s kubectl apply -f deployment.yaml && k3s kubectl rollout restart deployment/moja-aplikacja-deployment'

                echo 'Pomyślnie wdrożono!'
                                 
                }
            }
        }
    }
}  
