# Sample application for e2e DevOps Pipeline
### This is ci pipeline repository

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
- terraform | eksctl (any tool to deploy eks cluster)
- Kubernetes 
- Argocd

### Before you run  
- Preparing the environment:
    - Install Jenkins-Server: [Jenkins](https://github.com/Omar-Ahmed-Dt/complete-prodcution-e2e-pipeline/blob/master/scripts/install-jenkins.sh)
    - Install Jenkins-Agent: [Jenkins-Agent](https://github.com/Omar-Ahmed-Dt/complete-prodcution-e2e-pipeline/blob/master/scripts/jenkins-agent.sh)
    - Install Sonarqube: [Sonarqube](https://github.com/Omar-Ahmed-Dt/complete-prodcution-e2e-pipeline/blob/master/scripts/install-sonarqube.sh)

    ![ec2](https://github.com/Omar-Ahmed-Dt/complete-prodcution-e2e-pipeline/blob/master/images/ec2_instances.png)

    - Setup Jenkins-Agent: 

    ![Jenkins-Agent](https://github.com/Omar-Ahmed-Dt/complete-prodcution-e2e-pipeline/blob/master/images/jenkins_nodes.png)
