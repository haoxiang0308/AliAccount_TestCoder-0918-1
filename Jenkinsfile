pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                // Add your build commands here
                // For example: sh 'make build' or sh 'npm run build'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                // Add your test commands here
                // For example: sh 'make test' or sh 'npm test'
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed'
        }
    }
}