pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                script {
                    // Checkout code from 'master' branch
                    git branch: 'main', credentialsId: '7310a3eb-f60e-4df0-8819-49b444ae99e5', url: 'https://github.com/thanhlamha/Stel.git'
                }
            }
        }
        // Add more stages as needed for your build process
    }
}
