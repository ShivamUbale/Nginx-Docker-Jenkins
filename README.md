# Jenkins CI Pipeline with Docker & Nginx (Agent-Based)

This project demonstrates a **real-world Jenkins CI pipeline** where Docker-based builds are executed on a **dedicated Jenkins agent (node-02)**.  
The pipeline builds and runs an **Nginx Docker container** that serves a static HTML page.

This project is intentionally focused on **CI fundamentals**, clean agent usage, and Docker execution — without overloading with Kubernetes or Docker Hub.

---

## What This Project Does

- Jenkins pulls code from GitHub
- Jenkins controller schedules the job
- Jenkins agent (node-02) executes Docker commands
- Docker builds an Nginx image
- Docker runs a container
- Nginx serves an HTML page in the browser

---

## Tech Stack

- Jenkins (Controller + Agent)
- Docker
- Nginx
- Git & GitHub
- Linux
- Shell scripting

---

## Project Structure

nginx-docker-jenkins/
├── Dockerfile
├── index.html
├── script.sh
├── Jenkinsfile
└── README.md


---

## Architecture Flow

Developer
|
GitHub
|
Jenkins Controller
|
Jenkins Agent (node-02)
|
Docker
|
Nginx Container
|
Browser (HTML Page)


---

## Prerequisites

### Jenkins Controller Machine
- Jenkins installed and running
- Git plugin installed
- Node-02 configured as Jenkins agent
- GitHub Personal Access Token stored in Jenkins credentials

### Jenkins Agent (node-02)
- Linux machine
- Docker installed
- Jenkins user exists
- Jenkins user added to Docker group

```bash
sudo usermod -aG docker jenkins
sudo systemctl restart docker

---
### Jenkins Agent Configuration (node-02)
Name: node-02

Description:
Docker-enabled Jenkins agent for CI pipelines and containerized builds

Remote root directory:
/home/jenkins

Labels:
docker-agent linux

Usage:
Only build jobs with label expressions matching this node

Launch method:
Launch agents via SSH

This allows future pipelines to target this node reliably.
---

GitHub Repository Setup
Create a new GitHub repository

Push the project files to the main branch

Repository URL format:

https://github.com/<YOUR_GITHUB_USERNAME>/nginx-docker-jenkins.git
GitHub Personal Access Token (PAT)
Used by Jenkins to authenticate securely with GitHub.

PAT Scope
repo

Jenkins Credential Configuration
Kind: Username with password

Username: Your GitHub username

Password: GitHub Personal Access Token

ID: github-pat

Scope: Global

Credentials are managed centrally by Jenkins, not per agent.

Jenkins Job Configuration
Job Type: Pipeline

Definition: Pipeline script from SCM

SCM: Git

Repository URL:

https://github.com/<YOUR_GITHUB_USERNAME>/nginx-docker-jenkins.git
Credentials: github-pat

Branch Specifier:

*/main
Jenkinsfile
pipeline {
    agent { label 'docker-agent' }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/<YOUR_GITHUB_USERNAME>/nginx-docker-jenkins.git'
            }
        }

        stage('Build and Run Docker Container') {
            steps {
                sh 'chmod +x script.sh'
                sh './script.sh'
            }
        }
    }
}
Dockerfile
FROM nginx:alpine

COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80
script.sh
#!/bin/bash

docker build -t nginx-demo .
docker run -d -p 8080:80 --name nginx-demo-container nginx-demo
How to Run the Project
Ensure Jenkins agent (node-02) is ONLINE

Trigger the Jenkins pipeline

Jenkins schedules the job on node-02

Docker image is built

Docker container is started

Access the Application
Open a browser and visit:

http://<NODE-02-IP>:8080
You should see the HTML page served by Nginx.

Expected Jenkins Output
Git repository cloned successfully

Docker image built without errors

Docker container running

Jenkins build marked SUCCESS

Verification on Agent
Run on node-02:

docker ps
You should see the Nginx container running.

Screenshots to Include (Recommended)
Jenkins Dashboard showing the pipeline

Node-02 configuration page

Nodes page showing agent metrics (disk, architecture, uptime)

Jenkins console output (SUCCESS)

docker ps output on node-02

Browser showing HTML page

Why This Project Is Important
This project demonstrates:

Jenkins controller–agent architecture

Secure credential usage

Docker-based CI workflows

Real execution on a remote node

Clean separation of responsibilities

It is ideal for DevOps fresher roles and forms a strong foundation for advanced CI/CD projects.

Author
Shivam Ubale
