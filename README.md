# Technical-Tasks
Deploy wordpress application (wordpress is a blogging application with a MySQL backend), using Ansible, Terraform, Docker, Jenkins




# Summary
 - 1 - Write a docker-compose.yml file that starts wordpress application (wordpress is a blogging application with a MySQL backend).
 - 2 - Write a Terraform script that Deploy new server on AWS environment 
 - 3 - Write an ansible role that installs requimanets and packages on the servers, and run the application. 
 - 4 - Write a jenkins pipeline that does the following:
      a. Checks out this repository: f
      b. Deploy the project on the new server.

# Description
  
 
 * 1 - Docker-compose.yaml:
 ![image](https://user-images.githubusercontent.com/113102456/219937636-95031bcc-b32c-4989-9df9-b723ce11793d.png)


 * 2 - main.tf:
 ![image](https://user-images.githubusercontent.com/113102456/219937925-0a3d793d-7048-42ff-89fb-b32f4e77d46e.png)
![image](https://user-images.githubusercontent.com/113102456/219937943-ee6cef2c-8b13-409c-aadc-6dad25d7e8d2.png)
 
 
 * 3 Ansible role - main.yaml:
 ![image](https://user-images.githubusercontent.com/113102456/219937736-d8c7bb61-cbbe-407a-ab87-627d5dcf64c6.png)


 * 4 - Jenkins file:
 ![image](https://user-images.githubusercontent.com/113102456/219938010-9adc9ee3-8444-4b57-9082-20048c1d7f07.png)
