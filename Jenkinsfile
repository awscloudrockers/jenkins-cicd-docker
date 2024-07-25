pipeline {
    agent any

    parameters {
        string(name: 'DOCKER_IMAGE_NAME', description: 'Enter the Docker image name')
        string(name: 'GIT_REPO_URL', description: 'URL of the Git repository to clone')
        string(name: 'DOCKERHUB_USERNAME', description: 'DockerHub username for login')
        credentials(name: 'DOCKERHUB_CREDENTIALS', description: 'Credentials for DockerHub login', defaultValue: '', required: true)
    }

    environment {
        DOCKERHUB_CREDENTIALS_PSW = credentials('dockerhub_id')
    }

    stages {
        stage('Clone Repository') {
            steps {
                script {
                    echo "Cloning repository from ${params.GIT_REPO_URL}..."
                    sh "rm -rf /tmp/jenkins-cicd-docker"
                    sh "git clone ${params.GIT_REPO_URL} /tmp/jenkins-cicd-docker"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building Docker image ${params.DOCKER_IMAGE_NAME}..."
                    sh "sudo docker build -t ${params.DOCKER_IMAGE_NAME} /tmp/jenkins-cicd-docker"
                }
            }
        }

        stage('Push Docker Image to DockerHub') {
            steps {
                script {
                    echo "Pushing Docker image ${params.DOCKER_IMAGE_NAME} to DockerHub..."
                    withCredentials([string(credentialsId: 'dockerhub_id', variable: 'DOCKERHUB_CREDENTIALS_PSW')]) {
                        sh "echo \${DOCKERHUB_CREDENTIALS_PSW} | sudo docker login -u ${params.DOCKERHUB_USERNAME} --password-stdin"
                        sh "sudo docker tag ${params.DOCKER_IMAGE_NAME} ${params.DOCKERHUB_USERNAME}/${params.DOCKER_IMAGE_NAME}"
                        sh "sudo docker push ${params.DOCKERHUB_USERNAME}/${params.DOCKER_IMAGE_NAME}"
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
