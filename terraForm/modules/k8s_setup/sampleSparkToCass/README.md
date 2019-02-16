this is a sample pipeline that I deployed for my video.

Directions for deploying.
1) use the .sbt file to compile a jar file.  *Note -- Manually place ip address for cassandra db in your scala file*
2) upload this jar file to spark-master node using kubectl cp
3) generate test2.txt -- write a bash script to loop N number of times and print the line REVISION 4781981 72390319 Steven_Strogatz 2006-08-28T14:11:16Z SmackBot 433328 - This follow the format REVISION, article_id, rev_id, article_title, timestamp, username, user_id as seen in : https://github.com/kaenyyh/Insight_project_2018b
4) upload test2.txt to each spark-worker using kubectl cp
5) use uploadtoDB.sh to upload CsTable to the cassandra db
6) batch submit the jar file on the spark worker
