pipeline {
    agent any

    parameters {
        string(name: 'DOCKER_IMAGE_NAME', description: 'Enter the Docker image name')
        string(name: 'GIT_REPO_URL', description: 'URL of the Git repository to clone')
        string(name: 'DOCKERHUB_USERNAME', description: 'DockerHub username for login')
        credentials(name: 'DOCKERHUB_CREDENTIALS', description: 'Credentials for DockerHub login', defaultValue: '', required: true, binding: 'dockerhub_id')
    }

    environment {
        DOCKERHUB_CREDENTIALS_PSW = credentials('dockerhub_id')
    }

    stages {
        // Your stages here
    }

    post {
        success {
            echo 'Docker image build, run, and push successful!'
        }
        failure {
            echo 'Docker image build, run, or push failed.'
        }
    }
}
