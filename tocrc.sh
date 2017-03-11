#!/bin/bash

input=$(cat)
className=`grep "class" <<< "$input" | awk '{printf "%s", $3}'`
fields=`grep "private" <<< "$input" | grep -v "(" | sed 's/;//g' | sed "s/final//g" | awk '{printf "%s: %s\n", $3, $2}'`

echo "<table>"
echo "    <tr>"
echo "        <th colspan=\"2\">$className</th>"
echo "    </tr>"
echo "    <tr><td>"
oldIfs=$FS
IFS=$'\n'
for field in $fields
do echo "        $field <br/>"
done
IFS=$oldIfs
echo "    </td><td>"
echo "    </td></tr>"
echo "</table>"
echo

