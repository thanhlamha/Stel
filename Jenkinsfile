pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from GitHub
                git branch: 'main', credentialsId: '7310a3eb-f60e-4df0-8819-49b444ae99e5', url: 'https://github.com/thanhlamha/Stel.git'
            }
        }
    
    stage('Install dependencies') {
            steps {
                // Install Python and required libraries (if not already installed)
                // Example with pip:
                sh 'pip install -r requirement.txt'
            }
        }
        
        stage('Run Tests') {
            steps {
                // Run Robot Framework tests using a Windows batch script
                sh 'robot tests\\login/login.robot'
            }
        }
    }
    
    post {
        always {
            // Archive the test results for later reference
            archiveArtifacts artifacts: '**/output.xml', allowEmptyArchive: true
        }
    }
}
