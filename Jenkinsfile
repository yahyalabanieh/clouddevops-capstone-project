pipeline {
    environment {
    registry = "ylabanieh/capstone"
    registryCredential = 'docker-hub'
    }

    agent any
    stages {
        stage ('Cloning Git Repository') {
            steps {
                git 'https://github.com/yahyalabanieh/clouddevops-capstone-project.git'
            }
        }

        stage('Building Docker image') {
            steps {
                script {
                    sh 'docker build --tag capstone .'
                }
            }
        }

        stage('Deploy Docker Image') {
            steps {
                script {
                    withDockerRegistry([ credentialsId: "docker-hub", url: "" ]) {
                    sh 'docker push ylabanieh/capstone'
                    }
                }
            }
        }

        stage ('Upload green deployment to AWS') {
            steps {
               script {
                   sh 'kubectl apply -f deploy-green.yml'
               }
            }
        }

        stage ('Remove old blue deployment from AWS') {
            steps {
               script {
                   sh 'kubectl delete deploy/deployment-blue'
               }
            }
        }

        stage ('Add blue deployment to AWS') {
            steps {
               script {
                   sh 'kubectl apply -f deploy-blue.yml'
               }
            }
        }

        stage ('Remove old green deployment from AWS') {
            steps {
               script {
                   sh 'kubectl delete deploy/deployment-green'
               }
            }
        }
    }
}