FROM peterevans/vegeta:6.7
MAINTAINER backend@facetdata.com

# jq is required to construct json based config of Vegeta
RUN apk update \
 && apk add jq \
 && rm -rf /var/cache/apk/*

COPY events.json /apps/
COPY entrypoint.sh /apps/
WORKDIR /apps/

ENTRYPOINT /apps/entrypoint.sh
