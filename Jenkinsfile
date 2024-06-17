pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout your repository
                git branch: 'main', credentialsId: '7310a3eb-f60e-4df0-8819-49b444ae99e5', url: 'https://github.com/thanhlamha/Stel.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    docker.build("robot-framework-tests:latest")
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    // Run tests inside Docker container
                    docker.image("robot-framework-tests:latest").inside {
                        sh 'robot --outputdir results tests/login/'
                    }
                }
            }
        }

        stage('Cleanup') {
            steps {
                // Clean up Docker containers
                sh 'docker rm -f $(docker ps -a -q)'
            }
        }
    }

    post {
        always {
            // Clean up Docker images
            sh 'docker rmi -f robot-framework-tests:latest'
        }
    }
}
