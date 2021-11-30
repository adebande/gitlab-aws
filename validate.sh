#!/bin/bash

terraform fmt
for d in ./tf-modules/*/ ; do (cd "$d" && terraform fmt); done
terraform validate