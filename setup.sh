#!/bin/bash

# Script to Create Project Structure

mkdir -p modules modules/networking modules/compute

touch main.tf variables.tf outputs.tf provider.tf versions.tf .gitignore modules/networking/main.tf modules/networking/variables.tf modules/networking/outputs.tf modules/compute/main.tf modules/compute/variables.tf modules/compute/outputs.tf

# Ignore transient files
echo -e ".terraform/\n*.tfstate\n*.tfstate.backup\nterraform.tfvars" > .gitignore

echo "Project structure created successfully!"