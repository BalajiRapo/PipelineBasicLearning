pipeline {
    agent any

    tools {
        nodejs "NodeJS18"
    }

    stages {
        stage('Check Node') {
            steps {
                sh 'node -v'
                sh 'npm -v'
            }
        }
    }
}