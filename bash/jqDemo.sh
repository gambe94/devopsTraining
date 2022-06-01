#!/usr/bin/env bash

#curl 'https://api.github.com/repos/stedolan/jq/commits?per_page=5' | jq '.[0] | {message: .commit.message, name: .commit.committer.name}'

RESPONE=$(curl 'https://api.github.com/repos/stedolan/jq/commits?per_page=5')
#echo "${RESPONE}" > 'response.json'
jq '.[0] | {message: .commit.message, name: .commit.committer.name}' <<< "${RESPONE}"
#
#jq '.[] | {message: .commit.message, name: .commit.committer.name}' <<< "${RESPONE}"

#cat bash/response.json | jq '.[0] | {message: .commit.message, name: .commit.committer.name}'
#cat bash/response.json | jq 'map(select(.commit.author.name == "Mattias Wadman")) | .[] | {message: .commit.message, name: .commit.committer.name}'
#cat bash/response.json | jq  'map(select(.commit.author.name == "Mattias Wadman")) | [.[] | {message: .commit.message, name: .commit.committer.name}]'

#ORG_ALIAS='EburyGaborDev'
#sfdx force:org:display -u ${ORG_ALIAS} --verbose --json | jq '{username: .result.username, sfdxAuthUrl: .result.sfdxAuthUrl, password: .result.password, instanceUrl: .result.instanceUrl}' > cred.json

