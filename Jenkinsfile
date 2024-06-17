   
pipeline {
    agent any
    
    environment {
        PATH = "/usr/bin/firefox"
    }
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: '7310a3eb-f60e-4df0-8819-49b444ae99e5', url: 'https://github.com/thanhlamha/Stel.git'
            }
        }
            
        stage('Install dependencies') {
            steps {
                sh 'python3 -m venv venv'
                sh './venv/bin/pip install -r requirement.txt'
            }
        }

        stage('Run tests') {
            steps {
                script {
                        sh './venv/bin/robot tests/login/login.robot'
                }
            }
        }
        
        stage('Cleanup') {
            steps {
                sh 'rm -f geckodriver-*.log'
            }
        }
    }
    
    post {
        success {
            echo 'Tests passed - deployment can proceed'
        }
        
        failure {
            echo 'Tests failed - deployment halted'
        }
        
        always {
            sh 'rm -rf venv'
        }
    }
}
