pipeline {
    agent any  // Use 'any' agent type to allow running on any available agent

    
    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub repository
                git branch: 'main', credentialsId: '7310a3eb-f60e-4df0-8819-49b444ae99e5', url: 'https://github.com/thanhlamha/Stel.git'
            }
        }
        
        
    stage('Build') {
            steps {
                // Install Python dependencies
                bat 'pip install -r requirements.txt'
            }
        }

    //     stage('Test') {
    //         steps {
    //             // Run Robot Framework tests inside Docker container
    //             script {
    //                 docker.image(ROBOT_FRAMEWORK_IMAGE).inside('-v ${WORKSPACE}:/workspace') {
    //                     bat 'robot --outputdir /workspace/reports tests'
    //                 }
    //             }
    //         }
    //     }

    //     stage('Publish Results') {
    //         steps {
    //             // Publish Robot Framework test results in Jenkins
    //             junit 'reports/**/*.xml'
    //         }
    //     }
    // }
    
    // Post-build actions, notifications, etc.
    post {
        success {
            // Notification or other actions on successful build
        }
        failure {
            // Notification or other actions on failed build
        }
    }
}