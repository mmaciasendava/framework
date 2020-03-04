pipeline {
    agent any

    tools {
        maven 'maven3'
    }

    stages {
        stage('Run Tests') {
            steps {
                sh 'mvn clean verify'
            }
            post {
                always {
                    junit allowEmptyResults: true, testResults: 'target/**/*.xml'
                }
            }
        }
    }
}