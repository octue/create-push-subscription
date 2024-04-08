#!/bin/sh -l

octue deploy create-push-subscription $1 $2 $3 $4 --expiration-time=$5 --revision-tag=$6 --services-namespace=$7
