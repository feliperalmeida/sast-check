#!/bin/sh

RESULT=$(bandit --version && bandit -r -a vuln -ii -ll -x .git,.svn,.mvn,.idea,dist,bin,obj,backup,docs,tests,test,tmp,reports "$@")

RESULT="${RESULT//'%'/'%25'}"
RESULT="${RESULT//$'\n'/'%0A'}"
RESULT="${RESULT//$'\r'/'%0D'}"
echo "::set-output name=result::${RESULT}"
