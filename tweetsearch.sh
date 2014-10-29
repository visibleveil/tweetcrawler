#!/bin/bash

echo "Searching twitter for the last $2 that include the keyword $1"

wget -q https://twitter.com/search?q=$1&rpp=$2

echo "Creating wordlist based on search findings"

cat search\?q\=$1 | grep -v "<(?:"[^"]*"['"]*|'[^']*'['"]*|[^'">])+>" | tr "," \\n | grep "text" | cut -d"\"" -f4- | tr " " \\n | sed s/\"//g | sed s/\^\#//g | sed s/\^\@//g | grep -v "^http:" | grep -v "\\\\" | grep -v "class="
