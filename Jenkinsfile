pipeline {
    agent any  // Use 'any' agent type to allow running on any available agent

    
    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub repository
                git branch: 'main', credentialsId: '7310a3eb-f60e-4df0-8819-49b444ae99e5', url: 'https://github.com/thanhlamha/Stel.git'
            }
        }
        
        
        stage('Run Robot Framework Tests') {
            steps {
                // Execute Robot Framework tests inside Docker container
                script {
                        sh 'robot tests/login/login.robot'  // Adjusted path to your .robot file
                }
            }
        }
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
