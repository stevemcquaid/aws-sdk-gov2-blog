#!/bin/bash
set -ex

docker run -it --env-file aws.env --rm stevemcquaid/aws-sdk-gov2-blog:latest
