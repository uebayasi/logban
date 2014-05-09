define(`__ReNum__',`[1-9][0-9]*')dnl
define(`__Ip4Addr__', `__ReNum__\.__ReNum__\.__ReNum__\.__ReNum__')dnl
dnl
s/^.*named.*: client \(__Ip4Addr__\)#.* view external.*denied$/\1/p
