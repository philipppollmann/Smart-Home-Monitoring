#!/bin/bash

terraform init

terraform plan -auto-approve

terraform apply