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
                    junit '/Users/mmacias/.jenkins/workspace/AutomationFW/target/failsafe-reports/*.xml'
                }
            }
        }
    }
}