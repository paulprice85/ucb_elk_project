# ucb_elk_project
Unit 13 Project
## Automated ELK Stack Deployment

The files in this repository were used to configure the network diagram located in:

**Diagrams/ElkStackDiagram.png**

An editable draw.io file has also been provided.

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to recreate the entire deployment pictured above.  All files would need to be updated with your private IP addresses as well as login info you assign during setup.

This document contains the following details:

- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available.  A network security group has been deployed to only allow port 80 to pass to the load balancer.  All other traffic is dropped.

A Jumpbox has been deployed to provide a secure entry point for administering all servers.  

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the file system and system metrics (i.e. uptime)

The configuration details of each machine may be found below.

| Name                 	| Function          	| IP Address 	| Operating System 	|
|----------------------	|-------------------	|------------	|------------------	|
| Jump-Box-Provisioner 	| Gateway / Ansible 	| 10.0.0.5   	| Linux - Ubuntu   	|
| Elk-Server           	| ELK stack         	| 10.1.0.4   	| Linux - Ubuntu   	|
| Web-1                	| DVWA Web server   	| 10.0.0.8   	| Linux - Ubuntu   	|
| Web-2                	| DVWA Web server   	| 10.0.0.7   	| Linux - Ubuntu   	|

