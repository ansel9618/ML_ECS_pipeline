# /usr/bin/bash
# ref https://aws.amazon.com/premiumsupport/knowledge-center/lambda-layer-simulated-docker/
docker run -v "$PWD":/var/task "lambci/lambda:build-python3.8" /bin/sh -c "pip3 install newsapi-python==0.2.7 psycopg2-binary==2.9.9 -t python/lib/python3.8/site-packages/; exit"
zip -r newsapi-psycopg2.zip python 
sudo rm -rf python/ # delete not needed python file
