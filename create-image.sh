#!/bin/bash

npm install

npm run build

docker build -t deploy-test .

docker tag deploy-test:latest jeffersontdm/deploy-test

docker push jeffersontdm/deploy-test:latest