if [ -f /home/ubuntu/Mounted/passoff.txt ]
then
bash /home/ubuntu/Mounted/passoff.txt
yes | rm /home/ubuntu/Mounted/passoff.txt
fi
echo "." >>/home/ubuntu/dots
