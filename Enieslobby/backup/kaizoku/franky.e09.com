;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	franky.e09.com. root.franky.e09.com. (
			4		; Serial webserver
			; 2		; Serial no 6
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	franky.e09.com.
@	IN	A	192.204.2.4	; webserver
; @	IN	A	192.204.2.2	; no 6
super	IN	A	192.204.2.4
www	IN	CNAME	franky.e09.com.
www.super IN	CNAME	super.franky.e09.com.
ns1	IN	A	192.204.2.3
mecha	IN	NS	ns1
@	IN	AAAA	::1
