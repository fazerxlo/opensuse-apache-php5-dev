# opensuse-apache-php5-dev
Docker image with PHP5 Apache for development based on openSUSE Leap 42.3



## Packages

*	apache2
*	php5
*	php5-mysql
*	php5-xdebug

## php.ini custom settings

*	log_errors on
*	display_errors on

## default host custom settings

Default Apache www folder is /app

*	Options +Indexes +FollowSymLinks
*	AllowOverride All

## Loaded modules

*	core
*	mod_so
*	http_core
*	prefork
*	mod_unixd
*	mod_systemd
*	mod_actions
*	mod_alias
*	mod_auth_basic 
*	mod_authn_file
*	mod_authz_host
*	mod_authz_groupfile
*	mod_authz_core
*	mod_authz_user
*	mod_autoindex
*	mod_cgi
*	mod_dir
*	mod_env
*	mod_expires
*	mod_include
*	mod_log_config
*	mod_mime
*	mod_negotiation
*	mod_setenvif
*	mod_ssl
*	mod_socache_shmcb
*	mod_userdir 
*	mod_reqtimeout 
*	mod_authn_core 
*	mod_php5 
*	mod_rewrite
*	mod_headers
*	mod_access_compat

## Debugger

	zend_extension = "xdebug.so"
	xdebug.remote_enable=on
	xdebug.remote_autostart=off
	xdebug.remote_connect_back=on
	xdebug.remote_handler=dbgp
	xdebug.profiler_enable=0
	xdebug.profiler_output_dir="/app"
	xdebug.remote_port=9000

Remember to enable communication from Docker to host on port 9000 - please refer to your distro documentation.
