#Docker image with PHP5 Apache for development

FROM opensuse/leap:42.3


ENV WEB_DOCUMENT_ROOT=/app \
    WEB_DOCUMENT_INDEX=index.php \
    WEB_ALIAS_DOMAIN=*.vm \
    WEB_PHP_TIMEOUT=600 \
    WEB_PHP_SOCKET=""
ENV WEB_NO_CACHE_PATTERN="\.(css|js|gif|png|jpg|svg|json|xml)$"

COPY conf/etc /etc
COPY conf/opt /opt
COPY conf/app /app

RUN zypper -n ar -f http://download.opensuse.org/repositories/server:/php:/extensions/openSUSE_Leap_42.3/ 'PHP extensions'; \
    zypper --non-interactive --no-gpg-checks ref; \
    zypper --non-interactive in --recommends \
    apache2 php5 php5-mysql apache2-mod_php5 \
    php5-gd php5-gettext php5-mbstring php5-pear \
    php5-curl php5-suhosin php5-xdebug  vim mc ; \
    zypper clean; \
    sed -i 's/variables_order = "GPCS"/variables_order = "EGPCS"/g' /etc/php5/apache2/php.ini; \
    a2enmod php5; \
    a2enmod rewrite

ENTRYPOINT ["/opt/docker/start"]    

CMD ["start"] 


EXPOSE 80
