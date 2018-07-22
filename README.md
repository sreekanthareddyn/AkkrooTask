# AkkrooTask

Load balancer set up with 3 virtual linux machines (1 loadbalancer and 2 webservers), using vagrant autaomated steps.

NGINX is used on all three machines for this solution.

Requirements:

- Vagrant set up

Steps to recreate:

- execute Vagrant init in the desired directory and replace the Vagrant file from here
- create a directory "provisioning" and place config.yml and provision.sh files in that directory
- vagrant up to provision the virtual machines (All configurations will be loaded from provision.sh script)

Testing:

- Use loadbalancer IP "192.168.1.15" to test the functionality.
- Every time when we refresh the page the request will land in other web server as i am using default load balancing method which is round-robin
 
 

