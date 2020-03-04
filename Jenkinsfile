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
                    publishHTML([allowMissing: false, alwaysLinkToLastBuild: true, keepAll: true, reportDir: 'target/site/serenity/index.html', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: ''])
                    junit allowEmptyResults: true, testResults: '/Users/mmacias/.jenkins/workspace/AutomationFW/target/surefire-reports/*.xml'
                }
            }
        }
    }
}