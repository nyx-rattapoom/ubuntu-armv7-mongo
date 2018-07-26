FROM multiarch/ubuntu-core:armhf-bionic

COPY resource/ /usr/local/bin

RUN groupadd -r mongodb && useradd -r -g mongodb mongodb

RUN mkdir -p /data/db && chown -R mongodb:mongodb /data/db && \
    chmod +x /usr/local/bin/docker-entrypoint.sh && chmod +x /usr/local/bin/mongod

VOLUME /data/db
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 27017

CMD ["mongod", "--storageEngine=mmapv1"]
