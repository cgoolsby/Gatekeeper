while :
do
if [ -f /home/ubuntu/Mounted/passoff.txt ]
then
bash /home/ubuntu/Mounted/passoff.txt
yes | rm /home/ubuntu/Mounted/passoff.txt
sleep 3
else
sleep 30
fi
done

