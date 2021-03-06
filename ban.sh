#! /bin/sh

. /etc/logban.conf
: ${blacklist:=/var/tmp/blacklist}

ban()
{
	local new=$( /usr/bin/mktemp )
	local old=$( /usr/bin/mktemp )

	ban_dump_addrs >${old}
	/bin/cat ${old} ${1} |
	/usr/bin/sort -n -t . -u >${new}

	if /usr/bin/cmp -s ${old} ${new}; then
		:
	else
		ban_diff ${old} ${new}
	fi

	/bin/rm -f ${old} ${new} ${add}
}

ban_diff()
{
	local old=$1
	local new=$2
	local add=$( /usr/bin/mktemp )

	/usr/bin/diff -u ${old} ${new}
	/usr/bin/diff -u ${old} ${new} |
	/usr/bin/sed -ne '/^+[1-9]/s/^+//p' >${add}
	ban_addrs ${add}
	/bin/cat ${new} >${blacklist}

	/bin/rm -f ${add}
}

ban_addrs()
{
	addrs=$1
	while read a; do
		ban_addr ${a}
	done <${addrs}
}

ban_addr()
{
	ban_addr_npf "$@"
}

ban_dump_addrs()
{
	ban_dump_addrs_npf |
	/usr/bin/sort -n -t . -u
}

###
###
###

ban_addr_npf()
{
	/sbin/npfctl table blacklist add "$@"
}

ban_dump_addrs_npf()
{
	/sbin/npfctl table blacklist list
}

###
###
###

ban $1
