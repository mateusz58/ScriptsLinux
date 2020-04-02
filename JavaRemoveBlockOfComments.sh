#!/usr/bin/env bash
FILEARG=$1
echo $FILEARG
shopt -s globstar
for file in **/${FILEARG} ; do
    [ -e output.java ] && rm output.java
    if [  -f "$file" ]
        then
            ##removing comments
            perl -0pe 's|//.*?\n|\n|g; s#/\*(.|\n)*?\*/##g;' ${file}>output.java
            ## add empty line to the end of file
            [ -n "$(tail -c1 output.java)" ] && printf '\n' >>output.java
            echo "$0: File '${file}'file processed out:"
            rm ${file}
            mv output.java ${file}
    fi
done