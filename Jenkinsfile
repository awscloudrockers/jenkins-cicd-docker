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
        stage('Build') {
            steps {
                // Add your build steps here
                echo 'Building the application...'
            }
        }

        stage('Test') {
            steps {
                // Add your test steps here
                echo 'Running tests...'
            }
        }

        stage('Deploy') {
            steps {
                // Add your deployment steps here
                echo 'Deploying to production...'
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
