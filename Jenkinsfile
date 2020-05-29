pipeline {
    agent any
    environment {
        PATH="$HOME/.local/bin:$PATH"
    }
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
