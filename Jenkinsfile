
pipeline {
    agent any 

    environment {
        DOCKER_IMAGE_NAME = "my-simple-app"
        DOCKER_TAG = "${env.BUILD_ID}" 
        FULL_IMAGE_NAME = "${DOCKER_IMAGE_NAME}:${DOCKER_TAG}"
        CONTAINER_NAME = "${DOCKER_IMAGE_NAME}-run-${env.BUILD_ID}"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    echo "Starting to build Docker image: ${FULL_IMAGE_NAME}"
                    
                    docker.build(FULL_IMAGE_NAME, '.')
                    
                    echo 'Docker image built successfully.'
                }
            }
        }

        stage('Run Container in Local Environment (Retained)') {
            steps {
                script {
                    echo "Running container from image: ${FULL_IMAGE_NAME} without --rm flag."
                    echo "Container will be named: ${CONTAINER_NAME}"
                    
                    sh "docker run --name ${CONTAINER_NAME} ${FULL_IMAGE_NAME}"
                    
                    echo "Container has finished execution (status: Exited). It is NOT removed."
                    echo "You can view it using 'docker ps -a'."
                }
            }
        }
    }
}
