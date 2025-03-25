#!/usr/bin/env bash

# author: acikgozb
# description: An interface script between CI/CD pipelines and Terraform.
# goal: Making CI/CD vendors call user scripts instead of relying on them for execution (e.g using an action for `terraform apply`)

set -euo pipefail

function environment {
    GET_CALLER_IDENTITY_ARGS=(--query Account --output text)
    if [[ -n "${AWS_PROFILE:-}" ]]; then
        GET_CALLER_IDENTITY_ARGS+=(--profile "$AWS_PROFILE")
    fi
    AWS_ACCOUNT_ID=$(aws sts get-caller-identity "${GET_CALLER_IDENTITY_ARGS[@]}")

    APP_NAME="${APP_NAME:-"app"}"
    TF_BACKEND_STATE_BUCKET="terraform-$AWS_ACCOUNT_ID"    
    TF_BACKEND_KEY="apps/$APP_NAME.tfstate"

    echo "APP_NAME:$APP_NAME AWS_ACCOUNT_ID:$AWS_ACCOUNT_ID TF_BACKEND_STATE_BUCKET:$TF_BACKEND_STATE_BUCKET TF_BACKEND_KEY:$TF_BACKEND_KEY"
}

function init {
    terraform init \
        -backend-config region="$AWS_REGION" \
        -backend-config bucket="$TF_BACKEND_STATE_BUCKET" \
        -backend-config key="$TF_BACKEND_KEY" 
}

function plan {

    cat > ./terraform.tfvars <<-_EOF
key1="<env-value>"
key2="<static-value>"
_EOF

    terraform plan -var-file ./terraform.tfvars -out ./tfplan 
}

function apply {
    terraform apply ./tfplan
}

"$@"

