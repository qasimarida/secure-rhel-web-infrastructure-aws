\# Secure RHEL Web Infrastructure on AWS



\## Project Overview



This project demonstrates the deployment of a secure Linux web infrastructure on AWS using Red Hat Enterprise Linux, Podman containers, SELinux, firewalld, systemd, CloudWatch monitoring, and Application Load Balancer architecture.



The goal of this project is to combine practical Linux administration and AWS cloud infrastructure skills into one realistic production-style environment.



This project was built to strengthen hands-on experience in:



\* Linux administration

\* AWS infrastructure

\* Networking

\* Security hardening

\* Containers

\* Monitoring

\* Automation

\* Troubleshooting



\---



\# Architecture



```text

Internet User

&#x20;     |

&#x20;     v

Application Load Balancer

&#x20;     |

&#x20;     v

Target Group

&#x20;     |

&#x20;     v

RHEL EC2 Instance

&#x20;     |

&#x20;     +---------------------------+

&#x20;     |                           |

&#x20;     v                           v

firewalld                  SELinux Enforcing

&#x20;     |

&#x20;     v

Podman Container

&#x20;     |

&#x20;     v

Nginx Web Service

&#x20;     |

&#x20;     v

Custom HTML Web Page

&#x20;     |

&#x20;     v

systemd Persistent Service

```



\---



\# Technologies Used



\## AWS



\* Amazon EC2

\* Amazon VPC

\* Public and Private Subnets

\* Internet Gateway

\* Route Tables

\* Security Groups

\* Application Load Balancer

\* Target Groups

\* CloudWatch

\* SNS Alerts

\* AMI-based EC2 migration



\## Linux / RHEL



\* Red Hat Enterprise Linux 9

\* SSH hardening

\* SELinux

\* firewalld

\* systemd

\* Bash scripting

\* Networking troubleshooting

\* Linux permissions



\## Containers



\* Podman

\* Nginx container

\* Container volume mounts

\* Container persistence using systemd



\---



\# AWS Infrastructure Design



\## VPC



```text

10.0.0.0/16

```



\## Public Subnets



```text

10.0.1.0/24

10.0.3.0/24

```



\## Private Subnet



```text

10.0.2.0/24

```



\## Security Model



\* SSH restricted to administrator IP

\* HTTP exposed through ALB

\* firewalld enabled

\* SELinux enforcing

\* Root SSH login disabled

\* Password authentication disabled



\---



\# Linux Security Hardening



\## SSH Hardening



Configured:



```text

PermitRootLogin no

PasswordAuthentication no

```



Administrative access is performed using SSH keys and sudo privilege escalation.



\---



\## SELinux



SELinux remains in:



```text

Enforcing

```



Container volume mounts use proper SELinux labeling:



```bash

\-v /srv/project-web:/usr/share/nginx/html:Z

```



\---



\## firewalld



Configured to allow only required services:



\* SSH

\* HTTP



\---



\# Podman Container Deployment



The web service runs inside a Podman-managed Nginx container.



\## Example Deployment



```bash

sudo podman run -d \\

&#x20; --name project-web \\

&#x20; -p 80:80 \\

&#x20; -v /srv/project-web:/usr/share/nginx/html:Z \\

&#x20; docker.io/library/nginx

```



\---



\# systemd Integration



The containerized service is managed through systemd to ensure persistence after reboot.



\## Example Commands



```bash

sudo podman generate systemd --name project-web --files --new

sudo systemctl enable --now container-project-web.service

```



\---



\# Monitoring and Alerting



\## CloudWatch Metrics



Monitored:



\* CPU utilization

\* Network traffic

\* Disk operations



\## CloudWatch Alarm



Configured CPU utilization alarm:



```text

rhel-web-high-cpu

```



\## SNS Notifications



CloudWatch alarms integrated with SNS email notifications.



\---



\# Bash Health-Check Script



A custom Bash script was created to verify:



\* Podman container status

\* HTTP response

\* Port listening state

\* Disk usage



\## Example



```bash

\~/scripts/health-check.sh

```



\---



\# Operational Skills Demonstrated



This project demonstrates practical experience with:



\* AWS networking

\* Linux administration

\* SSH security

\* SELinux troubleshooting

\* firewalld configuration

\* Podman container management

\* systemd service persistence

\* CloudWatch monitoring

\* Infrastructure troubleshooting

\* AMI-based migration workflows



\---



\# Lessons Learned



\## Key Lessons



\* Application Load Balancers require multiple Availability Zones.

\* SELinux labeling is important for container volume access.

\* systemd improves container persistence and operational reliability.

\* Security Groups and firewalld provide layered security.

\* Infrastructure should be monitored, not only deployed.

\* SSH hardening is critical for secure Linux administration.



\---



\# Future Improvements



Potential future improvements:



\* HTTPS with AWS Certificate Manager

\* Route 53 domain integration

\* CloudWatch Agent for memory monitoring

\* Auto Scaling Group integration

\* CI/CD pipeline deployment



\---



\# Project Goals



The primary goal of this project was to combine Linux administration and AWS infrastructure concepts into one realistic hands-on deployment environment suitable for portfolio, interview, and resume use.



\---



\# Author



Qasim Arida



Linux | AWS | RHCSA | Cloud Infrastructure | System Administration



