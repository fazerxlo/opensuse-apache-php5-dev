#Docker image with PHP5 Apache for development

FROM opensuse/leap:42.3

COPY conf/etc /etc
COPY conf/opt /opt
COPY conf/app /app

RUN zypper -n ar -f http://download.opensuse.org/repositories/server:/php:/extensions/openSUSE_Leap_42.3/ 'PHP extensions'; \
    zypper --non-interactive --no-gpg-checks ref; \
    zypper --non-interactive in --recommends \
    apache2 php5 php5-mysql apache2-mod_php5 \
    php5-gd php5-gettext php5-mbstring php5-pear \
    php5-curl php5-suhosin php5-xdebug; \
    zypper clean; \
    sed -i 's/variables_order = "GPCS"/variables_order = "EGPCS"/g' /etc/php5/apache2/php.ini; \
    a2enmod php5; \
    a2enmod rewrite

ENTRYPOINT ["/opt/docker/start"]    

CMD ["start"] 


EXPOSE 80

