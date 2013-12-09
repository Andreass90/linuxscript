#!/bin/bash
now=$(date +"%D %T")
git add -A
git commit -m "$now"
git push
exit 0
