#!/bin/bash
branch=$(git rev-parse HEAD)
githubUser="arafato"
githubProject="linkedARMDemo"
repoUrl="https://raw.githubusercontent.com/$githubUser/$githubProject/$branch/"
resourceGroupName="fourt"
location="North Europe"
azure group create -n "$resourceGroupName" -l "$location"
azure group deployment create --debug-setting All --template-uri "$repoUrl/azuredeploy.json" --parameters "{\"repositoryUrl\":{\"value\":\"$repoUrl\"},\"projectPrefix\":{\"value\":\"fourt\"}}" -g "$resourceGroupName"
