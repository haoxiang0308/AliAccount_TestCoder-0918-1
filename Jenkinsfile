pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                // Add your build commands here
                // For example: sh 'make', sh 'npm run build', etc.
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                // Add your test commands here
                // For example: sh 'make test', sh 'npm test', etc.
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed'
        }
    }
}