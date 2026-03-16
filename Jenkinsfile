pipeline {
    agent any

    tools {
        nodejs "NodeJS18"
    }

    stages {

        stage('Checkout') {
            steps {
                git 'https://github.com/BalajiRapo/PipelineBasicLearning.git'
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