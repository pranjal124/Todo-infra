pipeline {
  agent any

  parameters {
    string(name: 'IMAGE_TAG', defaultValue: '', description: 'ECR image tag/build number to deploy (e.g. 42 or latest)')
    booleanParam(name: 'APPLY_INFRA', defaultValue: false, description: 'Apply Terraform changes?')
  }

  environment {
    AWS_DEFAULT_REGION = "ap-south-1"
  }

  stages {
    stage('Checkout') {
      steps {
        echo 'Cloning infra repo...'
        checkout scm
      }
    }

    stage('Terraform Init') {
      steps {
        echo 'Initializing Terraform...'
        sh 'terraform init -input=false'
      }
    }

    stage('Terraform Plan') {
      steps {
        echo "Planning Terraform changes for image tag: ${params.IMAGE_TAG}..."
        sh "terraform plan -var-file=terraform.tfvars -var=container_image=126024983515.dkr.ecr.ap-south-1.amazonaws.com/todoapp:${params.IMAGE_TAG} -input=false -out=tfplan"
      }
    }

    stage('Terraform Apply') {
      when {
        expression { params.APPLY_INFRA }
      }
      steps {
        echo 'Applying Terraform changes...'
        sh 'terraform apply -var-file=terraform.tfvars -input=false -auto-approve tfplan'
      }
    }
  }

  post {
    always {
      echo 'Terraform pipeline completed.'
    }
    success {
      echo 'Terraform apply succeeded!'
    }
    failure {
      echo 'Terraform apply failed! Check logs.'
    }
  }
}
