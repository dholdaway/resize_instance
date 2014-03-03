#!/bin/bash

aws ec2 describe-instances --query 'Reservations[*].Instances[*].[Tags[0].Value,InstanceId,ImageId,InstanceType,State.Name]' --output table

echo " would you like to stop or start"
read question

echo "Enter instanceID to " $question
read Instance

aws ec2 $question-instances --instance-ids $Instance --query 'State.Name' --output table

ec2-describe-instance-status --instance-ids $Instance

aws ec2 describe-instances --query 'Reservations[*].Instances[*].[Tags[0].Value,InstanceId,InstanceType]' --output table 

cat types.csv

echo "which type" 
read typetochange

aws ec2 $question-instances --instance-ids $Instance --query 'State.Name' --output table

echo "which instance to upgrade"
read newinstance

aws ec2 modify-instance-attribute --instance-id $newinstance --instance-type $typetochange --output table
