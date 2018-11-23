#!/bin/bash

printf '\n\n%s\n\n' 'The following playbooks are available:' 

for F in $(find -iname '*.yml'); do 
  printf '%s-%s\n' "$(echo $F | sed 's/.\///')" "$(grep -m 1 name $F | sed 's/- name: //')"
done | column -t -s '-'

printf '\n%s\n%s\n' 'Example usage:' '$ ansible-playbook -vv --ask-become-pass <playbook>'

