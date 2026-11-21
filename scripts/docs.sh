#!/bin/sh

for module in modules/*; do
    terraform-docs -c "${module}/.config/.terraform-docs.yaml" "${module}"
done;
