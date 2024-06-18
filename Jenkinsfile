pipeline {
    agent any
    parameters {
        string(name: 'Nametag', defaultValue: 'Uthred', description: 'Enter your name')
        choice(name: 'Domain', choices: ['ABC', 'DEF', '0123'], description: 'Choose your domain')
    }

    environment {
        // Ensure the path includes the directory where ChromeDriver and other binaries are installed
        PATH = "${env.PATH}:/usr/local/bin:/usr/bin:/opt/google/chrome"
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
                // echo "${params.NameTag}"
                // echo "${params.Domain}"
                sh './venv/bin/robot tests/login/login.robot --include tag_name'
                
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
