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
            steps {
                echo "Hello World"
            }
        }
        
        stage('Test') {
            agent {any 'docker_files_pytest'}
            steps {
                //Exécute les tests views et fonctionnels
                sh "pwd"
                sh "pytest -v test/test_views.py"
            }
        }
    }
}
