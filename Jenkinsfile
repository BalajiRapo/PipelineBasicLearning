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
                sh 'npm install @salesforce/cli --global'
            }
        }

        stage('Verify CLI') {
            steps {
                sh 'sf --version'
            }
        }

        stage('Deploy to UAT') {
            steps {
                sh 'echo "Deploying to UAT Org..."'
            }
        }
    }
}