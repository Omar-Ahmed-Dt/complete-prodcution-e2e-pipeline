   pipeline{
    agent{
        label "jenkins-agent"
    }
    tools {
        jdk 'Java17'
        maven 'Maven3'
    } 
    stages{
        stage("Cleanup Workspace"){
            steps {
                cleanWs()
            }

        }
    
        stage("Checkout from SCM"){
            steps {
                git 'https://github.com/Omar-Ahmed-Dt/complete-prodcution-e2e-pipeline.git'
                // git branch: 'main', credentialsId: 'github', url: 'https://github.com/Omar-Ahmed-Dt/complete-prodcution-e2e-pipeline.git'
            }

        }

        stage("Build Application"){
            steps {
                sh "mvn clean package"
            }

        }
        stage("Test Application"){
            steps {
                sh "mvn test"
            }

        }

    }
}