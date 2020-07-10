# tfe-load-prep
Used for load testing against a TFE server/cluser


## Required

After you've build a TFE Server or Cluster, all you need to do is create the initial admin user, and grab the admin token. Store that token as `TFE_TOKEN`.

GitHub.com - This config assumes you'll be using a GitHub.com repo.

* `tfehostname` - The URL of your TFE server
* `oauthtoken` - Token from GitHub.com [On the settings page](https://github.com/settings/tokens) create a personal access token with `admin:org, admin:org_hook, admin:repo_hook, repo` privileges. 
* `githubidentifier` - The GitHub org and repo name

## Optional

* `orgname` - The name of the TFE org to be created
* `email` - The email to associate with the org
* `workspacecount` - How many workspaces to create - note, there's a known issue: setting this above 10 intially will cause terraform errors. 
* `workspacename` - The default workspace name to use
* `terraformversion` - What version of tf to use
* `githubbranch` - Used to specify a non-default branch of the repo
* `ingresssubmodules` - Should sub-modules be ingressed

export DOMAINZONE=kotscloud
export INSTANCE_PREFIX=tfe3
export DNS=tfe3.kots.cloud
export PROJECT=replicated-qa

export ZONE=us-central1-c
export REGION=us-central1
export GITROOT=$(git rev-parse --show-toplevel)
export TFORMDIR=$GITROOT/environments/hashicorp/.terraform
export LICENSE_FILE=$GITROOT/environments/hashicorp/ptfe-releasesv202005-1.rli
export GOOGLE_PROJECT=${PROJECT}
export TF_VAR_project=${PROJECT}
export TF_VAR_region=${REGION}
export TF_VAR_zone=${ZONE}
export TF_VAR_cloud_init_license_file=${LICENSE_FILE}
export TF_VAR_dns_managed_zone=${DOMAINZONE}
export TF_VAR_dns_managed_zone_dns_name=${DNS}.
export TF_VAR_prefix=${INSTANCE_PREFIX}-
export TF_VAR_secondaries_min_instances=3
gcloud config set project ${PROJECT}

# Optional tfe-load-prep env variables
export TFE_TOKEN=69y8xpyYtwXT7g.atlasv1.Xvjq69yj4imr2KuiJqSEyJQCpcgaJU2HZxZDBpXCTObyEtJ3BZUFU6VGnQTBjXeW42Q
export TF_VAR_tfehostname=tfe3.kots.cloud
export TF_VAR_oauthtoken=8c56eb660e87f3b8eabd604fe19f98d6fd0d3812
export TF_VAR_githubidentifier=austinchambers/hashi-replicated-qa6
export TF_VAR_workspacecount=100
export TF_VAR_orgname=load-test-org