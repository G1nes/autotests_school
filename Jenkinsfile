pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                cleanWs()
                git url: 'git@gitlab.flora.ltfs.tools:heathers-repo/qa/e2e-backend-tests.git', branch: "${BRANCH}"
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