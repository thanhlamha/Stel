pipeline {
    agent {
        docker {
            // Use the official Python with Robot Framework Docker image
            image 'python:3.9-slim'
            label 'docker'
            args '-u root'  // Ensure Docker container runs with root user for permissions
        }
    }
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the repository
                git branch: 'main', credentialsId: '7310a3eb-f60e-4df0-8819-49b444ae99e5', url: 'https://github.com/thanhlamha/Stel.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                // Install Python dependencies using pip
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                // Run Robot Framework tests
                sh 'robot --outputdir results tests/'
            }
        }
    }

    post {
        always {
            // Publish Robot Framework test results
            junit 'results/output.xml'

            // Archive artifacts (e.g., logs, screenshots)
            archiveArtifacts artifacts: 'results/*.html, results/*.png', allowEmptyArchive: true
        }

        success {
            echo 'Tests ran successfully!'

            // Send notifications, integrate with other systems, etc.
        }

        failure {
            echo 'Tests failed!'

            // Send notifications, take remedial actions, etc.
        }
    }
}
