pipeline {
    agent any  // This will run the pipeline on any available agent

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from your GitHub repository
                git branch: 'main', credentialsId: '7310a3eb-f60e-4df0-8819-49b444ae99e5', url: 'https://github.com/thanhlamha/Stel.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                // Install any necessary dependencies
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                // Execute your Robot Framework tests
                sh 'robot --outputdir results tests/'
            }
        }
    }

    post {
        always {
            // Archive test artifacts
            archiveArtifacts artifacts: 'results/*.html, results/*.png', allowEmptyArchive: true
            // Publish JUnit test results
            junit 'results/output.xml'
        }

        success {
            echo 'Tests ran successfully!'
            // Additional actions upon successful build
        }

        failure {
            echo 'Tests failed!'
            // Additional actions upon failed build
        }
    }
}
