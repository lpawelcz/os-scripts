#!/bin/sh
for f in `pacman -Qlq`; do
	test -f "$f" || continue
	sed -nr '
	/^#!/!d
	\@^#![[:space:]]*/bin/(env[[:space:]]+)?sh\>@q1
	q
	' "$f" || checkbashisms -f "$f"
done
