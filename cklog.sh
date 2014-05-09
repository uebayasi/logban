#! /bin/sh

. /etc/logban.conf
: ${logbandir:=/usr/share/logban}

authlog=/var/log/authlog
maillog=/var/log/maillog
messages=/var/log/messages

ban_cmd=${logbandir}/ban.sh

###
###
###

update()
{
	local new=$( /usr/bin/mktemp )
	
	check_log |
	/usr/bin/sort -n -t . -u >${new}

	$ban_cmd ${new}

	/bin/rm -f ${new}
}

check_log()
{
	/usr/bin/sed -nf ${logbandir}/cklog-authlog.sed /var/log/authlog
	/usr/bin/sed -nf ${logbandir}/cklog-maillog.sed /var/log/maillog
	/usr/bin/sed -nf ${logbandir}/cklog-messages.sed /var/log/messages
}

###
###
###

update
