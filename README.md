# DevOps Automation and Deployment Project

In this project we deploy three microservices
- Payment: that handles billing verification
- Product: that allows clients to browse products
- Admin: that allows admins to manage our app

Architecture:

![Devops-Project-Architecture](https://user-images.githubusercontent.com/60438665/213247826-cc5add59-eb54-4504-ae5d-0fcc6803e979.png)

All microservices are dockerized and a CI pipeline was implemented to automatically publish the images onto Dockerhub

![image](https://user-images.githubusercontent.com/60438665/213248286-9be3d35a-60b3-4278-84be-0add82aabd25.png)

The application is deployed onto Azure Kubernetes service, the manifests that define our Kubernetes ressources are kept in sync with our cluster automatically using the GitOps tool argoCD

![image](https://user-images.githubusercontent.com/60438665/213249327-de5285e7-c50e-46b4-8a83-9da69a31cbb1.png)

![image](https://user-images.githubusercontent.com/60438665/213249523-370136ab-0e60-4e3c-9692-d5ba74047d9d.png)

#Metrics and Monitoring

- A prometheus service is installed onto our cluster and grafana (which is exposed to the internet through a Loadbalancer) exposes the collected data like shown below

![image](https://user-images.githubusercontent.com/60438665/213250474-5af84b5b-4f46-4c72-955e-d04eef6fe122.png)

- DataDog collects tracing and telemetry information and they are exposed through the DataDog managed service interface

![image](https://user-images.githubusercontent.com/60438665/213251121-8a8fa5ca-1e55-4ed9-b7c8-2f2b247a6c71.png)

# Automatic provisioning
4 kubernetes microstacks were implemeneted

![image](https://user-images.githubusercontent.com/60438665/213251545-8fda50c6-d848-41e9-8a1a-31ca62a79534.png)


- 1st stack provisions our terraform backend that remotly hold our tf state and an azure keyvault where we can save secrets shared between stacks
- 2nd stack provisions a postgres database
- 3rd stack provisions our kubernetes cluster and saves it's config in the azure keyvault provisioned in stack 1
- 4th stack installs argoCD on our cluster using helm which will then configure our application and deploy the required K8s ressources
