FROM dockerfile/nginx

ADD . /docker-build

RUN cp /docker-build/sites/default /etc/nginx/sites-available/default && \
    rm -rf /docker-build
