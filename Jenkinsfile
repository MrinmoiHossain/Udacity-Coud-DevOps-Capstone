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
	    stage('Build Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-credentials', usernameVariable: 'DOC_USERNAME', passwordVariable: 'DOC_PASSWORD')]) {
                    sh 'docker build -t mrinmoi/capstone .'
                }
            }
        }
	    stage('Upload Docker Image to Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-credentials', usernameVariable: 'DOC_USERNAME', passwordVariable: 'DOC_PASSWORD')]) {
                    sh '''
                        docker login -u $DOC_USERNAME -p $DOC_PASSWORD
                        docker push mrinmoi/capstone
                    '''
                }
            }
        }
        stage("Path Test") {
            steps {
                sh '''
                    echo $PATH
                    pwd
                '''
            }
        }
    }
}
