#!/bin/bash/
looking_document () { 
    mkdir /my/personal/directory/log/clientes
    cd /my/personal/directory/log/clientes/
    nodes=(ND01 ND02 ND03 ND04 ND06)
    for job in ${nodes[*]}
    do
        mkdir /my/personal/directory/log/clientes/$job
        aws --endpoint-url https://s3.private.us-south.cloud-object-storage.appdomain.cloud s3 cp s3://personal-s3-directory/$job/$job-COMPANY_ws.2020-08-26.tar.gz /my/personal/directory/log/clientes/$job
        cd /my/personal/directory/log/clientes/$job/ && tar -xzvf  $job-COMPANY_ws.2020-08-26.tar.gz && rm -rf *.tar.gz
        cat /my/personal/directory/log/clientes/$job/COMPANY_ws.log.2020-08-26 | grep -P "Total\s{13,13}total ms: [0-9]{1,7}"  > /my/personal/directory/log/clientes/$job/match.txt 
	ex +"%s/$/ $job/g" -cwq /my/personal/directory/log/clientes/$job/match.txt
	cat /my/personal/directory/log/clientes/$job/match.txt >> /my/personal/directory/log/clientes/total.txt
    done    
}
looking_document
sed 's/[][\\]/ /g; s/-/ /g' /my/personal/directory/log/clientes/total.txt | tr -d .zip | tr -d \.zip | tr -d \.ZIP | tr -d - | awk 'BEGIN {FS=" "} {print $1,$2,$3,$4,$5,$6,$7,$8,$15,$21}' > /my/personal/directory/log/clientes/filtro.csv
rm -rf /my/personal/directory/log/clientes/total.txt
sed 's/ /|/g' /my/personal/directory/log/clientes/filtro.csv  > /my/personal/directory/log/clientes/total.csv
rm -rf /my/personal/directory/log/clientes/filtro.csv

