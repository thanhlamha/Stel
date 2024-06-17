pipeline {
    agent any // Use 'any' agent type to allow running on any available agent

    environment {
        ROBOT_FRAMEWORK_IMAGE = 'your-robot-framework-image' // Replace with your Docker image containing Robot Framework
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub repository
                git branch: 'main', credentialsId: '7310a3eb-f60e-4df0-8819-49b444ae99e5', url: 'https://github.com/thanhlamha/Stel.git'
            }
        }

        stage('Build') {
            steps {
                // Install Python dependencies in a virtual environment
                script {
                    sh '''
                        python3 -m venv venv
                        source venv/bin/activate
                        pip install -r requirements.txt
                    '''
                }
            }
        }

        stage('Test') {
            steps {
                // Run Robot Framework tests inside Docker container
                script {
                    docker.image(ROBOT_FRAMEWORK_IMAGE).inside('-v ${WORKSPACE}:/workspace') {
                        sh 'robot --outputdir /workspace/reports tests'
                    }
                }
            }
        }

        stage('Publish Results') {
            steps {
                // Publish Robot Framework test results in Jenkins
                junit 'reports/**/*.xml'
            }
        }
    }

    // Post-build actions, notifications, etc.
    post {
        success {
            echo 'Pipeline succeeded! Sending notifications...'
            // Example: Send email notification on success
            emailext (
                to: 'your-email@example.com',
                subject: "Jenkins Build Successful: ${currentBuild.fullDisplayName}",
                body: "Build URL: ${env.BUILD_URL}"
            )
        }
        failure {
            echo 'Pipeline failed! Sending notifications...'
            // Example: Send email notification on failure
            emailext (
                to: 'your-email@example.com',
                subject: "Jenkins Build Failed: ${currentBuild.fullDisplayName}",
                body: "Build URL: ${env.BUILD_URL}",
                attachLog: true  // Attach Jenkins build log on failure
            )
        }
    }
}
