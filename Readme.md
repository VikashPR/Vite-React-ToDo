# Setup and Run the project 

### Install dependencies

``` bash
npm install
```
### Run the project

``` bash
npm run dev
```
# Setup CI/CD Pipeline

- Create a new repository on Github
- Install Docker on your machine

### Download Jenkins Image For Docker

``` bash
docker pull jenkins/jenkins:lts
docker run -p 8080:8080 jenkins/jenkins:lts
```
- Open your browser and go to http://localhost:8080/
- Copy the password from the terminal and paste it in the browser
- Install suggested plugins

# Run Jenkins in Docker 

### Create a bridge network in Docker using the following docker network create command:

``` bash
docker network create jenkins
```

``` bash
docker volume create jenkins-docker-certs
docker volume create jenkins-data
```

# Create your Pipeline project in Jenkins


- Go back to Jenkins, log in again if necessary and click create new jobs under Welcome to Jenkins!
Note: If you don’t see this, click New Item at the top left.

- In the Enter an item name field, specify the name for your new Pipeline project (e.g. CICD Jenkins Project).

- Scroll down and click Pipeline, then click OK at the end of the page.
Give any description of your choice.

- Click the Pipeline tab at the top of the page to scroll down to the Pipeline section.

- From the Definition field, choose the Pipeline script from SCM option. This option instructs Jenkins to obtain your Pipeline from Source Control Management (SCM), which will be your locally cloned Git repository.

- From the SCM field, choose Git.

- In the Repository URL field, specify the directory path of your locally React Project Repo, which is from your user account/home directory on your host machine, mapped to the /home directory of the Jenkins container – i.e. /home/Documents/GitHub/YOUR_REACT_PROJECT_NAME

- Click Save to save your new Pipeline project. You’re now ready to begin creating your Jenkinsfile, which you’ll be checking into your locally cloned Git repository.
