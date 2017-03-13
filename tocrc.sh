#!/bin/bash

oldIfs=$FS
IFS=$'\n'
input=$(cat)
className=`grep "class" <<< "$input" | awk '{printf "%s", $3}'`
fields=`grep "private" <<< "$input" | grep -v "(" | sed 's/;//g' | sed "s/\r//g" | sed "s/final//g" | awk '{printf "%s: %s\n", $3, $2}'`

echo "<table>"
echo "    <tr>"
echo "        <th colspan=\"2\">$className</th>"
echo "    </tr>"
echo "    <tr><td>"
for field in $fields
do echo "        $field <br/>"
done
echo "    </td><td>"
echo "    </td></tr>"
echo "</table>"
echo
IFS=$oldIfs

