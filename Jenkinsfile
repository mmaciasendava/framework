pipeline {
    agent any

    tools {
        maven 'maven3'
    }

    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean install'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn clean verify'
                sh 'mvn serenity:aggregate'
            }
            post {
                always {
                    junit allowEmptyResults: true, testResults: '/Users/mmacias/.jenkins/workspace/AutomationFW/target/failsafe-reports/*.xml'
                    publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'target/publishHTML', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: ''])
                }
            }
        }
    }
}