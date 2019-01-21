github=`cat github.txt`
sed -ie "s@GITHUB@$github@g" jenkins/template.xml
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

sudo service docker start

sudo docker-compose up -d --build

sudo docker-compose -f jenkins/docker-compose.yml up -d --build 

sudo apt install -y default-jre

while [ -z "$jp" ];
do
jp=`sudo docker logs JenkinsQuick 2>&1 | grep -A 2 "Please" | tail -1`
done

echo $jp > TempFile.txt
#jp=`cat TempFile.txt`
mkdir /home/ubuntu/Mounted

sleep 60


java -jar jenkins/jenkins-cli.jar -s http://localhost:8080/ -auth admin:$jp install-plugin git; java -jar jenkins/jenkins-cli.jar -s http://localhost:8080/ -auth admin:$jp create-job autoBuildFlask < jenkins/template.xml; java -jar jenkins/jenkins-cli.jar -s http://localhost:8080/ -auth admin:$jp restart 

bash loopCheck.sh &
