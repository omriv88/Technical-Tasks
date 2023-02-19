pipeline {
    agent {label 'linux_label'}
    
    tools {terraform 'terraform'}

    
    stages {
        stage('Git Checkout') {
            steps {
                sh 'git clone https://github.com/omriv88/deploy-demo.git'
                sh 'ls -l deploy-demo/'
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
                dir('/root/workspace/deploy-demo/deploy-demo'){
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform plan') {
            steps {
                dir('/root/workspace/deploy-demo/deploy-demo'){
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
