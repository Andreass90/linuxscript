#!/bin/bash
now=$(date +"%T")
git add -A
git commit -m "$now"
git push
