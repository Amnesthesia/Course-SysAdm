#
# Regular cron jobs for the vistarter package
#
0 4	* * *	root	[ -x /usr/bin/vistarter_maintenance ] && /usr/bin/vistarter_maintenance
