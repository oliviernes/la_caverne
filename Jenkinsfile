#!groovy

node {
    stage 'Test'
        sh './integration/integration.sh'

    stage 'Deploy'
        sh './deployment/deploy_prod.sh'
}
