pipeline {
    agent any
    }
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
                    junit '/var/jenkins_home/workspace/AutomationFW/target/failsafe-reports/*.xml'
                }
            }
        }
    }
}