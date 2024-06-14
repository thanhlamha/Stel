pipeline {
    agent any
    
    stages {
        stage('Clone') {
            steps {
                script {
                    // Use the correct credentialsId and repository URL
                    git credentialsId: '7310a3eb-f60e-4df0-8819-49b444ae99e5', url: 'https://github.com/thanhlamha/Stel.git'
                }
            }
        }
    }
}
