#!/bin/bash

COURSE="Devops from current script"

echo "Before calling other script : $COURSE"
echo "Process id of current script: $$"

./18-other-script.sh

echo "After calling other script : $COURSE"
echo "Process id of current script: $$"

<<com

$ sh 17-current-script.sh
Before calling other script : Devops from current script
Process id of current script: 1449
variable value from other script : Devops from other script
Process id of current script: 1450
After calling other script : Devops from current script
Process id of current script: 1449

com
