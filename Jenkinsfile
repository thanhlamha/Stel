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
                // Find the .robot file dynamically
                script {
                    def robotFilePath = findFiles(glob: '**/*.robot')[0]?.path
                    if (robotFilePath) {
                        def robotCommand = "robot ${robotFilePath}"
                        sh label: '', script: robotCommand
                    } else {
                        error "No .robot file found in the repository"
                    }
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
