pipeline {
    agent any
    stages {
        
        stage('Build') {
            agent {
                docker {
                    image 'docker_files_db'
                    image 'docker_files_pytest'
                }
            }
        }
        
        stage('Test') {
            steps {
                //Exécute les tests views et fonctionnels
                sh "pytest -v /usr/src/app/la_caverne/test/test_views.py"
            }
        }
        
        stage('Deploy'){}
    }
}
