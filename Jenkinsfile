pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout your GitHub repository
                git branch: 'main', credentialsId: '7310a3eb-f60e-4df0-8819-49b444ae99e5', url: 'https://github.com/thanhlamha/Stel.git'
            }
        }
        
        stage('Install dependencies') {
            steps {
                // Create a virtual environment
                sh 'python3 -m venv venv'
                sh './venv/bin/pip install -r requirements.txt'

            }
        }

        stage('Run tests') {
            steps {
                // Run your Robot Framework tests
                sh 'robot path/to/your/tests/*.robot'
                // You can specify more detailed options here as needed
            }
        }
        
        // Add more stages as per your deployment requirements
    }
    
    post {
        success {
            // Actions to perform when the pipeline succeeds
            echo 'Tests passed - deployment can proceed'
            // Add deployment steps here if needed
        }
        
        failure {
            // Actions to perform when the pipeline fails
            echo 'Tests failed - deployment halted'
            // Add any cleanup or notification steps here
        }
        
        always {
            // Deactivate virtual environment
            sh "deactivate"
        }
    }
}
