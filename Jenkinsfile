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
                    publishHTML([allowMissing: true, alwaysLinkToLastBuild: true, keepAll: true, reportDir: 'target/site/serenity/', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: ''])
                    junit allowEmptyResults: true, testResults: 'target/**/*JUNIT*.xml'
                }
            }
        }
    }
}