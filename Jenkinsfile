pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                // Add your build commands here
                sh 'echo "Build completed"'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                // Add your test commands here
                sh 'echo "Tests completed"'
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed'
        }
    }
}