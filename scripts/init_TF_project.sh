#!/bin/bash
APP_NAME=$1
mkdir $APP_NAME; cd $APP_NAME; touch main.tf; mkdir env; cd env; touch production.tfvars

