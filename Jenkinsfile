pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub repository
                git branch: 'main', credentialsId: '7310a3eb-f60e-4df0-8819-49b444ae99e5', url: 'https://github.com/thanhlamha/Stel.git'
            }
        }
        
        stage('Install Dependencies') {
            steps {
                // If you need to install any dependencies, add shell commands here
                sh 'pip install -r requirements.txt'  // Example for Python dependencies
            }
        }
        
        stage('Run Robot Framework Tests') {
            steps {
                // Execute Robot Framework tests
                script {
                    def robotCommand = "robot test/login/login.robot"
                    sh label: '', script: robotCommand
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
