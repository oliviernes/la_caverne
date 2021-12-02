#!groovy

node {

    try {
        stage 'Test'
            sudo sh './integration/integration.sh'

        stage 'Deploy'
            sh './deployment/deploy_prod.sh'
    }
}