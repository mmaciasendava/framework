pipeline {
    agent none

    tools {
        maven 'maven3'
    }

    stages {
        stage('Initialize')
        {
            def dockerHome = tool 'docker'
            env.PATH = "${dockerHome}/bin:${env.PATH}"
        }
        stage('docker') {
            agent {
                    docker {
                        image 'maven:3-alpine'
                        args '-v $HOME/.m2:/root/.m2'
                    }
                }
            }
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