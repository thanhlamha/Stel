pipeline {
    agent any

    environment {
        GIT_CREDENTIALS = '7310a3eb-f60e-4df0-8819-49b444ae99e5' // Replace with your actual credentials ID
        GIT_REPO_URL = 'https://github.com/thanhlamha/Stel.git'
        GIT_BRANCH = 'main' // Replace with your branch name if different
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    checkout([
                        $class: 'GitSCM',
                        branches: [[name: "*/${env.GIT_BRANCH}"]],
                        userRemoteConfigs: [[
                            url: env.GIT_REPO_URL,
                            credentialsId: env.GIT_CREDENTIALS
                        ]]
                    ])
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                // Install dependencies
                sh 'python3 -m pip install --upgrade pip'
                sh 'pip3 install robotframework'
            }
        }

        stage('Run Tests') {
            steps {
                // Run tests
                dir('path/to/your/tests') {
                    sh 'robot your_test_suite.robot'
                }
            }
        }

        stage('Publish Results') {
            steps {
                // Publish test results
                archiveArtifacts artifacts: 'path/to/your/tests/output.xml', allowEmptyArchive: true
                junit 'path/to/your/tests/output.xml'
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution completed.'
        }
    }
}
