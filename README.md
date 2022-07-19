# Devops_Challenge

### Overall System Thinking and Build process

Define a local Docker registry where  to store docker images:

#### Pros: Security-wise can help with images tampering, vulnerability to       				  
be sure that the image is safe and maintained by the DevOps teams. probably is more cost-effective for huge-scale operations.

#### Cons: Reliability and scalability are 2 significant concerns for this strategy, I tried to add a bucket to the docker. storage plugin, unfortunately, was not easy to implement as well.
Single point of failure for a container running as stand-alone in docker, even if it's set to restart=always

### Build and push Docker container:
This process can be done automatically via a script, in more complex scenarios if a new image is pulled from an external source, later can be build-tag-push to the internal repository

### App
I create a simple app in nodejs that use express to display "Hello World", and then change the "World" into something else as an example.
This process can be simplified with the dotenv module, which allows changing the app print message, without hardcoding the value, but just changing the value into an env file, repackaging the app and re-build the docker image, tagging it and pushed again into the local registry.

### Tagging scheme
I tried to use the easiest way to implement this, using a versioning labelling that can show minor and major changes, (probably a change logs could show better this).
```
on Docker registry: (at today)
 registry:2.8.1
 registry:2.8
 registry:2
 registry: latest
```

If no version is specified docker will automatically point to the latest, the issue is related to a specific image, it's difficult to create a reference that univocally can identify that specific image. One solution could be to use the <build-id> gives you correlation back to the specific build to find all the artefacts and logs, this can be expanded for example by adding a <build_system> tag taken from a CI/CD ex. (Jenkins).

### IaC 
Terraform has sbene used to build a K8s GKE cluste in GCP, once the cluster has been built, the following process is to install the web-app into a defined namespace.

###Helm chart
Helm has been used to create a chart that will install the web-app into k8s node and take care of running the workload.



### Interfaces
 
Loadbalncer to manage the incoming connection for the nodejs app.

### Testing:
I have tested only the docker part from the private registry to build and tagging process and push into repo.
Multiple version of the app have been create.
Terraform GKE cluster has been partially tested
No enough time for the helm chart test.


Overall performaces:
I mentioned above the pros and cons for the local docker registry, no intensive app load test has been done.

### Diagram

![alt tag](https://github.com/dhaile79/Devops_Challenge/blob/b4383bd711838f8d8e3bf0b623fd5a455d227d69/GCP%20Kubernetes%20nodes%20with%20GKE_nb.png)
