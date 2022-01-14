pipeline 
{
    agent any
    tools {
  maven 'MAVEN_HOME'
  terraform 'terraform-1'
}

    stages {
        // stage('Git_clone') { steps { bat 'git clone https://github.com/utkarshgupta611/JenkinsTerraformBuild.git' } }

        stage('Maven_Build') { 
            steps { 
                bat "mvn -Dmaven.test.failure.ignore=true clean package"
                 }
        }

        stage('Maven_Test') {
             steps {
                  bat 'mvn -Dmaven.test.failure.ignore=true test' 
                  } 
        }

        stage('terraform_init') { 
            steps { 
                bat 'terraform init' 
                } 
        }

        // stage('terraform_plan') {
        //      steps {
        //         bat 'terraform plan' 
        //         } 
        // }

        stage('terraform_apply') {
            steps { 
                bat 'terraform apply --auto-approve' 
                } 
        }
    }

    // post
    // {

    // 	always
    // 	{
    // 		emailext body: 'Summary', subject: 'Pipeline Status', to: 'selenium3bymukesh@gmail.com'
    // 	}

    // }
}
