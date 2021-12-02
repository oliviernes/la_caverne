#!groovy

pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                echo "Hello World!"
                sh "echo Hello from the shell"
                sh './integration/integration.sh'
            }
        }
        stage('Deploy') {
            steps {
                sh './deployment/deploy_prod.sh'
            }
        }
    }
}


