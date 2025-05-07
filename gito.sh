#!/bin/bash

# Get current timestamp in a readable format
timestamp=$(date "+%Y-%m-%d %H:%M:%S")

git status 

# Add all changes
git add .

git staus 

# Commit with timestamp message
git commit -m "$timestamp" 

git status