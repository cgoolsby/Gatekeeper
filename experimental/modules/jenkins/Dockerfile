FROM jenkins/jenkins:lts

USER root

RUN apt-get update && \
apt-get -y install apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common && \
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
    $(lsb_release -cs) \
    stable" && \
apt-get update && \
apt-get -y install docker-ce

RUN apt-get install -y docker-ce

RUN usermod -a -G docker jenkins

USER jenkins

#ARG jenkinsPass
#RUN jenkinsPass=`cat /var/jenkins_home/secrets/initialAdminPassword`; echo $jenkinsPass; \
#RUN wget localhost:8080/jnlp/Jars/jenkins-cli.jar
#RUN echo 'jenkins.model.Jenkins.instance.securityRealm.createAccount("user1", "password123")' | \
#   java -jar jenkins-cli.jar -s http://localhost:8080/ groovy =

