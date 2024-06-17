
pipeline {
    agent any
    
    environment {
        // Define the path to your virtual environment
        VENV = 'venv'
        // Define the Python executable within the virtual environment
        PYTHON_EXECUTABLE = "${VENV}/Scripts/python"
    }
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout the repository
                git branch: 'main', credentialsId: '7310a3eb-f60e-4df0-8819-49b444ae99e5', url: 'https://github.com/thanhlamha/Stel.git'
            }
        }
        
        stage('Setup Virtual Environment') {
            steps {
                // Create and activate the virtual environment
                sh "python -m venv ${VENV}"
                sh "${VENV}\\Scripts\\activate"
            }
        }
        
        stage('Install Dependencies') {
            steps {
                // Install Python dependencies from requirements.txt
                sh "${PYTHON_EXECUTABLE} -m pip install -r requirement.txt"
            }
        }
        
        stage('Run Tests') {
            steps {
                // Run Robot Framework tests
                sh "${PYTHON_EXECUTABLE} -m robot --outputdir results tests/"
            }
        }
        
        stage('Publish Results') {
            steps {
                // Archive test results
                junit 'results/*.xml'
            }
        }
    }
    
    post {
        always {
            // Clean up virtual environment after the build
            deleteDir()
        }
    }
}
