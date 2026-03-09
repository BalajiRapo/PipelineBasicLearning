pipeline {
    agent any

    tools {
        nodejs "NodeJS18"
    }

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Install Salesforce CLI') {
            steps {
                sh 'npm install sfdx-cli --global'
            }
        }

        stage('Deploy to UAT') {
            steps {
                sh 'sfdx --version'
            }
        }
    }
}