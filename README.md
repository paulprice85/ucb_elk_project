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

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jumpbox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:

- 73.202.86.210

Machines within the network can only be accessed by the Jumpbox machine at 10.0.0.5.

A summary of the access policies in place can be found in the table below.

| Name 	| Publicly Accessible 	| Allowed IP Addresses 	| Allowed Ports 	|
|---	|---	|---	|---	|
| Jump-Box-Provisioner 	| Yes 	| 73.202.86.251 	| SSH 22 	|
| Elk-Server 	| No 	| n/a 	| n/a 	|
| Web-1 	| DVWA Web server 	| n/a 	| n/a 	|
| Web-2 	| DVWA Web server 	| n/a 	| n/a 	|

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it allow for much greater scaling by reducing administrative burden.

The ELK playbooks implements the following tasks:
 
- Install Docker and associated bits
- Install ELK
- Install Filebeats
- Install Metricbeats
- Start all services required to run ELK

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

(Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _TODO: List the IP addresses of the machines you are monitoring_

We have installed the following Beats on these machines:
- _TODO: Specify which Beats you successfully installed_

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the _____ file to _____.
- Update the _____ file to include...
- Run the playbook, and navigate to ____ to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
- _Which URL do you navigate to in order to check that the ELK server is running?

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
