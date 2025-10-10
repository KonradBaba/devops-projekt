pipeline {
    agent any // Uruchom na dowolnym dostępnym agencie

    stages {
        // Etap 1: Pobieranie kodu z repozytorium
        stage('Checkout') {
            steps {
                // Jenkins automatycznie pobierze kod z repozytorium,
                // w którym znajdzie ten plik Jenkinsfile
                checkout scm
            }
        }

        // Etap 2: Budowanie obrazu Docker
        stage('Build Docker Image') {
            steps {
                script {
                    echo 'Rozpoczynam budowanie obrazu Docker...'
                    // Tworzymy unikalną nazwę dla obrazu, używając numeru builda
                    def imageName = "moja-super-apka:${env.BUILD_NUMBER}"

                    // Używamy wbudowanej funkcji Jenkinsa do budowania obrazu
                    docker.build(imageName)
                    echo "Pomyślnie zbudowano obraz: ${imageName}"
                }
            }
        }
    }
}
