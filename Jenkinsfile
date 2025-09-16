pipeline {
    agent any

    parameters {
        string(name: 'BRANCH', defaultValue: 'master', description: 'Git branch to build/sync')
        choice(name: 'SYNC_MODE', choices: ['fast', 'full'], description: 'Sync mode')
    }

    stages {
        stage('Initialize Repo') {
            steps {
                sh '''
                chmod +x scripts/repo_initialize.sh
                ./scripts/repo_initialize.sh "$BRANCH"
                '''
            }
        }

        stage('Sync Repo') {
            steps {
                sh '''
                chmod +x scripts/repo_sync.sh
                ./scripts/repo_sync.sh "$SYNC_MODE"
                '''
            }
        }
        stage('Run on Specific Node') {
            agent { label 'Buildika' } 
            steps {
                bat 'echo Running this stage on the Windows runner'
            }
        }
    }

    post {
        always {
            echo "Pipeline finished."
        }
    }
}
