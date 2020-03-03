pipeline {
    agent any

    stage ('Build') {
        steps {
            sh 'mvn clean verify'
        }
        post {
            success {
                junit 'target/surefire-reports/**/*.xml'
            }
        }
    }
}