#
# See https://hub.docker.com/_/php/
# See https://github.com/docker-library/php/blob/6677546d599d3980781b520f84d03ecaad291dd1/7.2/stretch/fpm/Dockerfile
#

FROM php:5.6-fpm
MAINTAINER leon <jiangxilee@gmail.com>

#
# For writable
#
RUN usermod -u 1000 www-data

# MAC OSX
# RUN usermod -u 1000 www-data && usermod -G staff www-data

#
# Install software
#
RUN apt-get update && apt-get install -y \
    libfreetype6 \
    libfreetype6-dev \
    libjpeg62-turbo \
    libjpeg62-turbo-dev \
    mcrypt \
    libmcrypt4 \
    libmcrypt-dev \
    libmhash2 \
    libpng-dev \
    zlib1g-dev \
    python2.7

#
# Install software ZLIB
#
RUN curl -fsSL 'http://www.zlib.net/zlib-1.2.11.tar.gz' -o zlib.tar.gz \
    && mkdir -p /tmp/zlib \
    && tar -xf zlib.tar.gz -C /tmp/zlib --strip-components=1 \
    && rm -f zlib.tar.gz \
    && ( \
        cd /tmp/zlib \
        && ./configure \
        && make -j$(nproc) \
        && make install \
    ) \
    && rm -r /tmp/zlib

#
# EXT imagick with dependent ImageMagick
#
RUN curl -fsSL 'https://www.imagemagick.org/download/ImageMagick.tar.gz' -o imagemagick.tar.gz \
    && mkdir -p /tmp/imagemagick \
    && tar -xf imagemagick.tar.gz -C /tmp/imagemagick --strip-components=1 \
    && rm -f imagemagick.tar.gz \
    && ( \
        cd /tmp/imagemagick \
        && ./configure --prefix=/usr/local/imagemagick --with-jpeg=yes --with-png=yes \
        && make -j$(nproc) \
        && make install \
    ) \
    && rm -r /tmp/imagemagick \
    && curl -fsSL 'http://pecl.php.net/get/imagick-3.4.3.tgz' -o imagick.tgz \
    && mkdir -p /tmp/imagick \
    && tar -xf imagick.tgz -C /tmp/imagick --strip-components=1 \
    && rm -f imagick.tgz \
    && docker-php-ext-configure /tmp/imagick --with-imagick=/usr/local/imagemagick \
    && docker-php-ext-install /tmp/imagick \
    && rm -r /tmp/imagick

#
# EXT gd、zip
#
RUN docker-php-ext-configure \
    gd \
        --with-freetype-dir=/usr/include \
        --with-jpeg-dir=/usr/include \
    && docker-php-ext-install -j$(nproc) gd zip

#
# Ext install by PECL
#
RUN pecl install redis-3.1.5 \
    &&  docker-php-ext-enable redis

#
# Ext core extensions
#
# Possible values for ext-name:
#
# bcmath bz2 calendar ctype curl dba dom enchant exif fileinfo
# filter ftp gd gettext gmp hash iconv imap interbase intl json
# ldap mbstring mysqli oci8 odbc opcache pcntl pdo pdo_dblib
# pdo_firebird pdo_mysql pdo_oci pdo_odbc pdo_pgsql pdo_sqlite
# pgsql phar posix pspell readline recode reflection session
# shmop simplexml snmp soap sockets sodium spl standard sysvmsg
# sysvsem sysvshm tidy tokenizer wddx xml xmlreader xmlrpc
# xmlwriter xsl zend_test zip
#
RUN docker-php-ext-install -j$(nproc) \
    bcmath \
    calendar \
    dba \
    exif \
    gettext \
    mysqli \
    pcntl \
    pdo_mysql \
    shmop \
    sockets \
    sysvmsg \
    sysvsem \
    sysvshm

COPY ./entrypoint /usr/local/init-service
RUN chmod a+x /usr/local/init-service

# -- eof --
