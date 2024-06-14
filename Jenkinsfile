pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from your Git repository
                git branch: 'main', credentialsId: '7310a3eb-f60e-4df0-8819-49b444ae99e5', url: 'https://github.com/thanhlamha/Stel.git'
            }
        }
        
        stage('Run Robot Framework Tests') {
            steps {
                // Define the path to your .robot file
                script {
                    def robotCommand = "robot tests/login/login.robot"
                    sh label: '', script: robotCommand
                }
            }
        }
    }
    
    post {
        success {
            echo "Robot Framework tests executed successfully"
            // You can add additional actions upon successful execution
        }
        failure {
            echo "Robot Framework tests failed"
            // You can add additional actions upon failure
        }
    }
}
