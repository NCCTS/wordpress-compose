FROM orchardup/php5

ADD . /docker-build

RUN /docker-build/curl.sh && \
    /docker-build/wordpress.sh && \
    cp -R /docker-build/wordpress /wordpress && \
    rm -rf /docker-build
