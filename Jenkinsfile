pipeline {
    agent any
    
    environment {
        // Ensure the path includes the directory where Chrome and chromedriver are installed
        PATH = "${env.PATH}:/usr/local/bin:/usr/bin:/opt/google/chrome"
        CHROME_DRIVER_PATH = "/usr/local/bin/chromedriver"
    }
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout your GitHub repository
                git branch: 'main', credentialsId: '7310a3eb-f60e-4df0-8819-49b444ae99e5', url: 'https://github.com/thanhlamha/Stel.git'
            }
        }
        
        stage('Install dependencies') {
            steps {
                // Create a virtual environment
                sh 'python3 -m venv venv'
                // Activate the virtual environment and install dependencies
                sh './venv/bin/pip install -r requirement.txt'
            }
        }

        stage('Run tests') {
            steps {
                script {
                    // Set up Chrome options
                    def chromeOptions = new ChromeOptions()
                    chromeOptions.addArguments("--headless", "--disable-gpu", "--no-sandbox")
                    
                    // Set the path to chromedriver
                    System.setProperty("webdriver.chrome.driver", "${CHROME_DRIVER_PATH}")
                    
                    // Initialize ChromeDriver
                    WebDriver driver = new ChromeDriver(chromeOptions)
                    
                    try {
                        // Run Robot Framework tests
                        sh './venv/bin/robot tests/login/login.robot'
                    } finally {
                        // Quit WebDriver session
                        driver.quit()
                    }
                }
            }
        }
        
        stage('Cleanup') {
            steps {
                // Delete geckodriver log files if any (optional if not using Firefox)
                sh 'rm -f geckodriver-*.log'
            }
        }
        
        // Add more stages as per your deployment requirements
        
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
        
        always {
            // Clean up virtual environment
            sh 'rm -rf venv'
        }
    }
}
