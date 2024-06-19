pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                cleanWs()
                git url: 'https://github.com/G1nes/autotests_school.git', branch: "${BRANCH}"
            }
        }
        stage('Build') {
            steps {
                sh 'docker build -t tests .'
            }
        }
        stage('Test') {
            steps {
                script {
                    sh '''
                        docker stop tests || true
                        docker rm tests || true
                    '''
                    sh 'docker run --name tests'
                }
            }
        }
    }
}