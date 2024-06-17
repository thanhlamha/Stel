pipeline {
    agent any
    
    environment {
        // Ensure the path includes the directory where Firefox, geckodriver, and other binaries are installed
        PATH = "${env.PATH}:/usr/local/bin:/usr/bin"
        GECKO_DRIVER_PATH = "/usr/local/bin/geckodriver"
    }
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: '7310a3eb-f60e-4df0-8819-49b444ae99e5', url: 'https://github.com/thanhlamha/Stel.git'
            }
        }
            
        stage('Install dependencies') {
            steps {
                // Create a virtual environment
                sh 'python3 -m venv venv'
                // Install dependencies within the virtual environment
                sh './venv/bin/pip install -r requirement.txt'
            }
        }

        stage('Run tests') {
            steps {
                // Run your Robot Framework tests within the virtual environment
                sh './venv/bin/robot tests/login/login.robot'
                // Adjust the path to your tests and WebDriver as needed
            }
        }
        
        stage('Cleanup') {
            steps {
                // Delete geckodriver log files
                sh 'rm -f geckodriver-*.log'
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
            // Clean up virtual environment
            sh 'rm -rf venv'
        }
    }
}
