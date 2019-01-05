#!/bin/bash
rm ./errors.log
highlight\
	--batch-recursive=*.nim\
	--validate-input\
	--replace-tabs=2\
	--base16\
	--style=material\
	--font=consolas\
	--font-size=14\
	2>>errors.log
