# ucb_elk_project
Unit 13 Project
## Automated ELK Stack Deployment

The files in this repository were used to configure the below network diagram.

![ElkStackDiagram](https://user-images.githubusercontent.com/85187830/133912435-c5063eb2-f2eb-42a3-8de1-ba11dc628d4e.png)



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
| Elk-Server 	| Yes 	| 73.202.86.251	| 5601 	|
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

![docker_ps_output](https://user-images.githubusercontent.com/85187830/133912314-e550c63e-544b-4fc8-ad37-2b7b7eb0eb3f.PNG)


### Target Machines & Beats
This ELK server is configured to monitor the following machines:

- Web-1 : 10.0.0.8
- Web-2 : 10.0.0.7

Both servers are running Ubuntu and Apache Web Services and are primarly functioning as DVWA Web Servers.

We have installed the following Beats on these machines:

- FileBeats
- MetricBeats

These Beats allow us to collect the following information from each machine:

- FileBeats monitors the log files or locations that you specify, collects log events, and forwards them to Logstash (The 'L' in ELK) for indexing.

- MetricBeats collects metrics from the system and services running on the server and forwards them to Logstash.  Apache is an example of one of these services.


### Using the Playbook
In order to use the playbook to deploy the ELK stack, you will need to have an Ansible control node already configured and any machines you want to monitor deployed.  You will also need to make sure any network controls allow SSH access to the control node. You may want to restrict this to a specific system (i.e. a JumpBox) and setup a public key for access.  Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the ansible-config.yml file to /etc/ansible.
- Update the ansible.cfg file to include **remote_user = AdminUser** (i.e. the admin user you setup on the destination server).  A copy of of our file has been included in this repo as an example.
- Update the /etc/ansible/host file with a section called [elk].  It should look something like this but with the IP of your destination server.  A copy of our file has been included in this repo.
    - [elk]
    - 10.1.0.4 ansible_python_interpreter=/usr/bin/python3
- Run the playbook (ansible-config.yml), The format for running the playbook is **ansible-playbook ansible-config.yml**, and navigate to http://ElkServerIP:5061 to verify the installation worked as expected.
- **note** during our setup we found that the Apache install errored out because we already had installed it.  Modifying the section for apache2 to include **state: present** instead of state: absent allowed our playbook to complete successfully.

### Installing FileBeat and MetricBeat on your monitored servers
Assuming you already have web servers deployed that you want to monitor we have provided two playbooks and config files for installing FileBeat and MetricBeat.

- filebeat-config.yml and filebeat-playbook.yml
- metricbeat-config.yml and metricbeat-playbook.yml

The install is similiar to the Elk install except you must make sure to include your webservers in the [webserver] section of the hosts file.  The two beat playbooks are configured to install to any server in the [webservers] section of the hosts file.  Remember to copy all 4 files to /etc/ansible/ folder on your Ansible control node.

