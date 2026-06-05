pipeline {
    agent {
        node {
            label 'your-node-label' // Replace with your actual Jenkins node label
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
