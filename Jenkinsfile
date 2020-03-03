pipeline {
    agent {
        docker {
            label 'docker'
            image 'maven:3-alpine'
            args '-v $HOME/.m2:/root/.m2'
        }
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