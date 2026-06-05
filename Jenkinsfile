pipeline {
    agent {
        node {
            label 'slave1' // Replace with your actual Jenkins node label
        }
    }
    stages {
        stage('Checkout Source Code') {
            steps {
                // For public repositories
                checkout scmGit(
                    branches: [[name: '*/main']],
                    userRemoteConfigs: [[url: 'https://github.com']]
                )
            }
        }
    }
}
