#!/usr/bin/env bash

if true ; then
#  ^^^^ std ^ kwa
	cat <<- EOF >> /tmp/outfile
	File contents
	EOF
#   ^^^ str
fi
#< kwa

# FIXME:
cat << 'EOF' > /path/to/your/file
This line will write to the file.
${THIS} will also write to the file, without the variable contents substituted.
EOF
#    ^ ipl  ^^^^ str


ss='dsadsa'
