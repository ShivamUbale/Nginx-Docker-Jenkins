# 🚀 Jenkins CI/CD Pipeline – Dockerized Nginx Web App

A **beginner-to-intermediate DevOps project** demonstrating a real-world CI/CD workflow using **GitHub, Jenkins, Docker, and Nginx** with a **dedicated Jenkins agent (node-02)**.

This project is designed to be **clean, professional, reusable**, and easy for others to understand and extend.

---

## 📌 Project Overview

This project automates the process of:

1. Pulling source code from **GitHub**
2. Building a **Docker image** with **Nginx**
3. Serving a static **HTML website**
4. Running everything via a **Jenkins Pipeline** on a **remote Jenkins agent (node-02)**

It follows **real DevOps practices** like:

* Agent-based execution
* Secure GitHub authentication (PAT)
* Script-based Docker automation

---

## 🧱 Architecture

```
Developer → GitHub → Jenkins Controller
                     ↓
               Jenkins Agent (node-02)
                     ↓
                 Docker Engine
                     ↓
                  Nginx Container
                     ↓
                Web App in Browser
```

---

## 🛠️ Tech Stack

| Tool    | Purpose                |
| ------- | ---------------------- |
| GitHub  | Source code repository |
| Jenkins | CI/CD automation       |
| Docker  | Containerization       |
| Nginx   | Web server             |
| Linux   | Jenkins nodes          |

---

## 📁 Repository Structure

```
nginx-docker-jenkins/
│
├── nginx/
│   ├── Dockerfile
│   └── index.html
│
├── script.sh
├── Jenkinsfile
└── README.md
```

---

## 📄 File Explanations

### 🔹 `nginx/Dockerfile`

* Uses official Nginx image
* Copies `index.html` into web root
* Exposes port 80

### 🔹 `nginx/index.html`

* Simple static webpage
* Used to verify successful deployment

### 🔹 `script.sh`

* Automates Docker build and run
* Stops old containers safely
* Ensures clean redeployment

### 🔹 `Jenkinsfile`

* Defines pipeline stages
* Uses **node-02** as agent
* Pulls code from GitHub
* Executes Docker commands

---

## ⚙️ Prerequisites

### Jenkins Controller

* Jenkins installed
* Git plugin enabled
* GitHub credentials configured (PAT)

### Jenkins Agent (node-02)

* Docker installed
* Jenkins user created
* Agent connected and **ONLINE**

> ❗ Jenkins **does NOT need to be installed** on node-02

---

## 🔐 GitHub Authentication (PAT)

This project uses **GitHub Personal Access Token (PAT)** for secure authentication.

Configured in:

```
Jenkins → Manage Jenkins → Credentials → Global
```

Credential Type:

* **Username with password**
* Username: your GitHub username
* Password: GitHub PAT

---

## ▶️ Jenkins Pipeline Configuration

### Job Type

* **Pipeline**

### Pipeline Definition

* Pipeline script from SCM

### SCM Settings

```
SCM: Git
Repository URL: https://github.com/<YOUR_USERNAME>/nginx-docker-jenkins.git
Credentials: github-pat
Branch: */main
```

### Agent Label

```
node-02
```

---

## 🌐 Output

After a successful build:

* Docker container runs on **node-02**
* Nginx serves the web page
* App is accessible via browser

Example:

```
http://<node-02-ip>:8080
```

---

## 📸 Suggested Screenshots (Highly Recommended)

Add these screenshots to make the project more professional:

1. **GitHub Repository Structure**
2. **Jenkins Pipeline Configuration Page**
3. **Jenkins Successful Build Console Output**
4. **Nodes Page Showing node-02 ONLINE**
5. **Docker Containers Running on node-02 (`docker ps`)**
6. **Web App Output in Browser**

> 📁 Store screenshots inside a `/screenshots` folder

---

## 🧠 What This Project Demonstrates

✅ Real CI/CD workflow

✅ Jenkins controller–agent architecture

✅ Dockerized deployments

✅ Secure GitHub authentication

✅ Industry-relevant DevOps skills

---

## 🚀 Possible Enhancements

* Push image to Docker Hub
* Add version tagging
* Integrate Nginx reverse proxy
* Add Kubernetes deployment
* Add Ansible-based provisioning

---

## 👤 Author

**Shivam Ubale**
Aspiring DevOps Engineer

---

## ⭐ Final Notes

This project is intentionally simple but **architecturally correct**.

It’s perfect for:

* Freshers
* DevOps learners
* Resume projects
* Interview discussions

If you understand this project end-to-end, you are **already ahead of many beginners**.
