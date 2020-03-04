pipeline {
    agent any

    tools {
        maven 'maven3'
        docker 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
    }

    stages {
        stage('Build') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'mmaciasendava', url: 'https://github.com/mmaciasendava/framework/']]])
                echo 'mvn -B -DskipTests clean install'
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