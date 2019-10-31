#!/bin/bash
rm ./errors.log >/dev/null 2>&1
highlight\
	--isolate\
	--encoding=UTF-8\
	--config-file=hugo.lang\
	--batch-recursive=*.hug\
	--validate-input\
	--replace-tabs=2\
	--config-file=../vanilla.theme\
	--style-infile=../test-theme.css\
	--font=consolas\
	--font-size=12\
	2>>errors.log
