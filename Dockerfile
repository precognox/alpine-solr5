FROM frolvlad/alpine-oraclejdk8:slim

RUN apk --update add curl tar bash

ENV SOLR_VERSION 5.2.1

RUN mkdir -p /opt/solr && \
curl https://dist.apache.org/repos/dist/release/lucene/solr/$SOLR_VERSION/solr-$SOLR_VERSION.tgz | tar -xzC /opt/solr --strip=1 && \
ln -s /opt/solr-$SOLR_VERSION /opt/solr

EXPOSE 8983

CMD ["/opt/solr/bin/solr", "-f"]
