pipeline {
    agent any
    stages {
        stage('Installing dependencies via Makefile') {
            steps {
                sh 'make install'
            }
        }
        stage('Lint checks on the code') {
            steps {
                sh 'make lint'
            }
        }
    }
}
