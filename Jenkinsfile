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
                // Assuming you need Python and Robot Framework installed
                sh 'pip install robotframework'
                // Add any other dependencies installation steps here
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
        // For example, deploying your application after tests pass
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
    }
}
