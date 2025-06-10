#!/bin/bash
service php7.3-fpm start
service nginx reload
nginx -g 'daemon off;'