pipeline {
    agent any
    stages {
        
        stage('Build') {
            agent {
                //Vérifie que toutes les images requises pour le build sont présentes dans le docker
                any {
                    image 'docker_files_db'
                    image 'docker_files_pytest'
                }
            }
        }
        
        stage('Test') {
            agent {docker 'docker_files_pytest'}
            steps{
                //Exécute les tests views et fonctionnels
                bat "pytest test --junitxmlm test/output.xml"
            }
        }
        
        stage('Deploy') {}
    }
}
