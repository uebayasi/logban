define(`__ReNum__',`[1-9][0-9]*')dnl
define(`__ReIp4Addr__',`__ReNum__\.__ReNum__\.__ReNum__\.__ReNum__')dnl
dnl
s/^.*NOQUEUE: reject: RCPT from .*\[\(__ReIp4Addr__\)\]: .*$/\1/p
s/^.*: pop3-login: Aborted login .*: user=<>, rip=\(__ReIp4Addr__\), lip=.*$/\1/p
s/^.*: lost connection after AUTH from unknown\[__ReIp4Addr__\]$/\1/p
