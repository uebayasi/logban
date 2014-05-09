define(`__ReNum__',`[1-9][0-9]*')dnl
define(`__ReIp4Addr__',`__ReNum__\.__ReNum__\.__ReNum__\.__ReNum__')dnl
dnl
s/^.*Failed password for root from \(__ReIp4Addr__\) port .*$/\1/p
s/^.*Failed password for invalid user .* from \(__ReIp4Addr__\) port .*$/\1/p
