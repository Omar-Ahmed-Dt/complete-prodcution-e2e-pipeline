# Complete e2e DevOps Pipeline
### This is ci pipeline repository


![Pipeline](https://github.com/Omar-Ahmed-Dt/complete-prodcution-e2e-pipeline/blob/master/images/ci_cd_pipeline.png)


- Once a developer pushes the code into the Source Code Management (SCM) repository, such as GitHub, Jenkins will be notified of the new application update. Subsequently, Jenkins will initiate the build and testing process for the Java application, utilizing Maven to execute various tests. Upon the successful completion of the application build, we will perform an in-depth analysis using a static code analysis tool named SonarQube. This analysis aims to identify and address any potential code smells or security issues before the code proceeds to production.

- If the analysis is successful, the next step involves building and pushing a Docker image to our Docker Hub registry. To enhance security, we will employ trivy for Static Code Analysis (SCA) to scan the Docker image, identifying any additional vulnerabilities within the container. Following this, we will update a set of manifest files residing in a dedicated repository: [Continuous Delivery repository](https://github.com/Omar-Ahmed-Dt/gitops-complete-prodcution-e2e-pipeline) .

- Once the tag has been updated in the CD repo, Argo CD, a continuous delivery tool, will come into play. Argo CD will deploy the latest version of the tagged application into our Kubernetes cluster, specifically an Amazon EKS cluster. This comprehensive process ensures that the code is thoroughly tested, analyzed for security issues, and seamlessly deployed into the production environment.

### Prerequisites
- maven
- git
- Jenkins
- Docker
- Sonarqube
- Trivy
- [Terraform](https://github.com/Omar-Ahmed-Dt/complete-prodcution-e2e-pipeline/tree/master/terraform) | [eksctl](https://github.com/Omar-Ahmed-Dt/complete-prodcution-e2e-pipeline/tree/master/eksctl) (any tool to deploy eks cluster)
- Kubernetes 
- Argocd

### Before you run  
- Preparing the environment:
    - Install Jenkins-Server: [Jenkins](https://github.com/Omar-Ahmed-Dt/complete-prodcution-e2e-pipeline/blob/master/scripts/install-jenkins.sh)
    - Install Jenkins-Agent: [Jenkins-Agent](https://github.com/Omar-Ahmed-Dt/complete-prodcution-e2e-pipeline/blob/master/scripts/jenkins-agent.sh)
    - Install Sonarqube: [Sonarqube](https://github.com/Omar-Ahmed-Dt/complete-prodcution-e2e-pipeline/blob/master/scripts/install-sonarqube.sh)

    ![ec2](https://github.com/Omar-Ahmed-Dt/complete-prodcution-e2e-pipeline/blob/master/images/ec2_instances.png)

    - Create credentials in jenkins

    ![Credentials](https://github.com/Omar-Ahmed-Dt/complete-prodcution-e2e-pipeline/blob/master/images/credentials.png)

    - Setup Jenkins-Agent 

    ![Jenkins-Agent](https://github.com/Omar-Ahmed-Dt/complete-prodcution-e2e-pipeline/blob/master/images/jenkins_nodes.png)

    -  Setup Sonarqube server: 
        1. Create Token for Jenkins
        2. Create Sonarqube Webhook for Quality Gate

    ![SonarQube](https://github.com/Omar-Ahmed-Dt/complete-prodcution-e2e-pipeline/blob/master/images/sonarqube_token.png)

    ![SonarQube2](https://github.com/Omar-Ahmed-Dt/complete-prodcution-e2e-pipeline/blob/master/images/sonarqube.png)

    - Create Dockerhub Token for Jenkins

    ![Dockerhub](https://github.com/Omar-Ahmed-Dt/complete-prodcution-e2e-pipeline/blob/master/images/dockerhub.png)

    - Test CI Pipeline

    ![ci](https://github.com/Omar-Ahmed-Dt/complete-prodcution-e2e-pipeline/blob/master/images/ci_pipeline.png)

    - Deploy EKS in AWS

    ![eks](https://github.com/Omar-Ahmed-Dt/complete-prodcution-e2e-pipeline/blob/master/images/eks_cluster.png)

    - Install Argocd in EKS 

    ![argocd](https://github.com/Omar-Ahmed-Dt/complete-prodcution-e2e-pipeline/blob/master/images/argocd.png)

    ![argocd2](https://github.com/Omar-Ahmed-Dt/complete-prodcution-e2e-pipeline/blob/master/images/argocd2.png)

    - Create CD pipeline

    ![CD](https://github.com/Omar-Ahmed-Dt/complete-prodcution-e2e-pipeline/blob/master/images/cd_pipeline.png)