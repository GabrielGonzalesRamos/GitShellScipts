#!/bin/bash
#VARIABLES
hostname=$(hostname | grep -P -oh "jboss\d{1,2}|jboss\-\d{2}pse")
#NODES
case $hostname in 
  jboss1)
    node="ND01" ;; 
  jboss2)
    node="ND02" ;; 
  jboss3)
    node="ND03" ;; 
  jboss4)
    node="ND04" ;; 
  jboss5)
    node="ND05" ;; 
  jboss6)
    node="ND06" ;;
  jboss7)
    node="ND07" ;;
  jboss8)
    node="ND08" ;;
  jboss9)
    node="ND09" ;;
  jboss10)
    node="ND10" ;;
  jboss11)
    node="ND11" ;;
  jboss12)
    node="ND12" ;;
  jboss13)
    node="ND13" ;;
  jboss-01pse)
    node="PSE1" ;;
  jboss-02pse)
    node="PSE2" ;; 
esac
moving_logs () {
   cd /my/personal/directory/log/
   for i in $(ls /my/personal/directory/log/ | grep "bizlinksOSE_ws.log.$(date +%Y --date="yesterday")" | grep -P "_\d+$" )
   do
     mv $i $(echo "$i" | cut --complement -c30-31)
   done
   for i in $(ls /my/personal/directory/log/ | grep "bizlinksOSE_ws.log.$(date +%Y --date="yesterday")")
   do 
     tar -czvf $node-$i.tar.gz $i --remove-files
     mv $node-$i.tar.gz $(echo "$node-$i.tar.gz" | cut --complement -c20-23)
     aws --endpoint-url https://s3.private.us-south.cloud-object-storage.appdomain.cloud s3 mv /my/personal/directory/log/$(echo "$node-$i.tar.gz" | cut --complement -c20-23) s3://personal-s3-directory/$node/
   done
   rm -rf /opt/jboss-eap-7.3/standalone/log/server.log.20*
}
moving_logs
