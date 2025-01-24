#bin/bash

personal_access_token=${1?Error: No Personal Access Token Provided}
service=${2?Error: No Service Provided}
version=${3?Error: No Version Provided}
repo_owner="tonyrud" 
repo_name="devsecops-online-boutique-k8s"  
event_type="trigger-workflow" 

curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $1" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/$repo_owner/$repo_name/dispatches \
  -d "{\"event_type\": \"$event_type\", \"client_payload\": {\"service\": \"$service\", \"version\": \"$version\", \"unit\": false, \"integration\": true}}"