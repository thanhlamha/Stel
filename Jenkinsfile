pipeline {
    agent any  // Use 'any' agent type to allow running on any available agent
    
    environment {
        DOCKER_IMAGE = 'python:3.9'  // Specify the Docker image to use
    }
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub repository
                git branch: 'main', credentialsId: '7310a3eb-f60e-4df0-8819-49b444ae99e5', url: 'https://github.com/thanhlamha/Stel.git'
            }
        }
        
        stage('Set Up Environment') {
            steps {
                // Run Docker commands to create virtual environment and install dependencies
                script {
                    docker.image(DOCKER_IMAGE).inside {
                        sh '''
                            python -m venv venv
                            source venv/Scripts/activate  # Adjust for Windows path
                            python -m pip install --upgrade pip
                            pip install -r requirements.txt  # Install Python dependencies
                        '''
                    }
                }
            }
        }
        
        // stage('Run Robot Framework Tests') {
        //     steps {
        //         // Execute Robot Framework tests inside Docker container
        //         script {
        //             docker.image(DOCKER_IMAGE).inside {
        //                 sh 'robot path/to/your/testfile.robot'
        //             }
        //         }
        //     }
        // }
    }
    
    post {
        success {
            echo "Robot Framework tests executed successfully"
            // Add actions upon successful execution
        }
        failure {
            echo "Robot Framework tests failed"
            // Add actions upon failure
        }
    }
}
