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
            }
            post {
                always {
                    publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'publichHTML', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: ''])
                    junit allowEmptyResults: true, testResults: '/Users/mmacias/.jenkins/workspace/AutomationFW/target/failsafe-reports/*.xml'
                }
            }
        }
    }
}