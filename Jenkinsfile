pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Install CLI') {
            steps {
                sh 'npm install sfdx-cli --global'
            }
        }

        stage('Deploy to UAT') {
            steps {
                sh 'sfdx force:source:deploy -p force-app -u UAT'
            }
        }
    }
}