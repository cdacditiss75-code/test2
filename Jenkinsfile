// Jenkinsfile

pipeline {
    agent any // The pipeline will run on any available Jenkins agent

    environment {
        // Define the Docker image name
        DOCKER_IMAGE_NAME = "my-simple-app"
        // Use the build number as the tag for unique versions
        DOCKER_TAG = "${env.BUILD_ID}" 
        FULL_IMAGE_NAME = "${DOCKER_IMAGE_NAME}:${DOCKER_TAG}"
        // Define a specific name for the running container based on the build ID
        CONTAINER_NAME = "${DOCKER_IMAGE_NAME}-run-${env.BUILD_ID}"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    echo "Starting to build Docker image: ${FULL_IMAGE_NAME}"
                    
                    // Build the image using the Dockerfile in the current directory
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
                    
                    // Execute the image. It will print "hey kedar" and then exit (stop).
                    // The --name flag ensures we can easily reference the container later.
                    sh "docker run --name ${CONTAINER_NAME} ${FULL_IMAGE_NAME}"
                    
                    echo "Container has finished execution (status: Exited). It is NOT removed."
                    echo "You can view it using 'docker ps -a'."
                }
            }
        }
    }
}
