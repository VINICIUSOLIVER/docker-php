#!/bin/bash
service php8.1-fpm start
service nginx reload
nginx -g 'daemon off;'