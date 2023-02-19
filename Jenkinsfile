pipeline {
    agent {label 'linux_label'}
    
    tools {terraform 'terraform'}

    
    stages {
        stage('Git Checkout') {
            steps {
                sh 'git clone https://github.com/omriv88/Technical-Tasks.git'
                sh 'ls -l Technical-Tasks/'
            }
        }
        stage('Terraform version') {
            steps {
                sh 'terraform version'
                sh 'pwd'
            }
        }
        
        stage('Terraform init') {
            steps {
                dir('/root/workspace/deploy-demo/Technical-Tasks'){
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform plan') {
            steps {
                dir('/root/workspace/deploy-demo/Technical-Tasks'){
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
