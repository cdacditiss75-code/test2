// Jenkinsfile

pipeline {
    agent any // Specifies that the pipeline can run on any available Jenkins agent

    environment {
        // Define the Docker image name 
        DOCKER_IMAGE_NAME = "my-simple-app"
        // Use the build number as the tag for unique versions
        DOCKER_TAG = "${env.BUILD_ID}" 
        FULL_IMAGE_NAME = "${DOCKER_IMAGE_NAME}:${DOCKER_TAG}"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building Docker image: ${FULL_IMAGE_NAME}"
                    // The '.' specifies that the Dockerfile is in the current directory
                    docker.build(FULL_IMAGE_NAME, '.')
                    echo 'Docker image built successfully.'
                }
            }
        }

        stage('Run and Test Container') {
            steps {
                script {
                    echo "Running container to verify output..."
                    
                    // Run the container and capture its standard output (stdout)
                    def output = sh(
                        script: "docker run --rm ${FULL_IMAGE_NAME}", 
                        returnStdout: true 
                    ).trim()
                    
                    echo "Container Output: ${output}"
                    
                    // Assert the output matches the expected string
                    if (output == "hey kedar") {
                        echo 'Verification successful: Output matches "hey kedar".'
                    } else {
                        error "Verification failed! Expected 'hey kedar', but got '${output}'"
                    }
                }
            }
        }

    }
}
