pipeline {
    agent any
    
    environment {
        // Define environment variables if needed
        VENV = "${WORKSPACE}/venv"  // Path to virtual environment
    }
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout your GitHub repository
                git branch: 'main', credentialsId: '7310a3eb-f60e-4df0-8819-49b444ae99e5', url: 'https://github.com/thanhlamha/Stel.git'
            }
        }
        
        stage('Set up environment') {
            steps {
                // Create and activate the virtual environment
                sh "python -m venv ${VENV}"
                sh "source ${VENV}/bin/activate"
            }
        }
        
        stage('Install dependencies') {
            steps {
                // Install dependencies from requirements.txt
                sh "pip install -r requirements.txt"
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
