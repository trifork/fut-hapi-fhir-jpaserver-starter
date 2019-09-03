#!/bin/bash

set -e

tag=$(date -u "+%Y-%m-%d")
imageTag=hapi-stub:$tag
docker build -t $imageTag .

docker tag $imageTag registry.admin.ehealth.sundhed.dk/trifork-dev/$imageTag
docker push registry.admin.ehealth.sundhed.dk/trifork-dev/$imageTag