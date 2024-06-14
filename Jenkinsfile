pipeline {
    agent any
    
    environment {
        // Define the credentials ID used in Jenkins for accessing the Git repository
        GIT_CREDENTIALS = credentials('7310a3eb-f60e-4df0-8819-49b444ae99e5	')
    }
    
    stages {
        stage('Clone') {
            steps {
                // Clone the repository using the specified credentials
                script {
                    git credentialsId: "${GIT_CREDENTIALS}", url: 'https://github.com/thanhlamha/Stel.git'
                }
            }
        }
    }
}
