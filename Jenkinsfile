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
             // Create a directory for executables
                    sh 'mkdir -p ${WORKSPACE}/bin'
                    
                    // Download msedgedriver using curl
                    sh 'curl -s -L -o msedgedriver.zip https://msedgedriver.azureedge.net/109.0.1518.70/edgedriver_linux64.zip'
                    
                    // Extract the msedgedriver
                    sh 'unzip -o msedgedriver.zip -d ${WORKSPACE}/bin'
                    
                    // Make msedgedriver executable
                    sh 'chmod +x ${WORKSPACE}/bin/msedgedriver'
                    
                    // Download geckodriver using curl
                    sh 'curl -s -L -o geckodriver.tar.gz https://github.com/mozilla/geckodriver/releases/download/v0.30.0/geckodriver-v0.30.0-linux64.tar.gz'
                    
                    // Extract the geckodriver
                    sh 'tar -xzf geckodriver.tar.gz -C ${WORKSPACE}/bin'
                    
                    // Make geckodriver executable
                    sh 'chmod +x ${WORKSPACE}/bin/geckodriver'

                // Create a virtual environment
                sh 'python3 -m venv venv'
                sh './venv/bin/pip install -r requirement.txt'

            }
        }

        stage('Run tests') {http://localhost:8080/job/Lam/22/console
            steps {
                // Run your Robot Framework tests
                sh './venv/bin/robot tests/login/login.robot'
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
