FROM peterevans/vegeta:6.7
MAINTAINER backend@facetdata.com

# jq is required to construct json based config of Vegeta
RUN apk --no-cache update \
 && apk add jq \
 && rm -rf /var/cache/apk/*

COPY entrypoint.sh /apps/
WORKDIR /apps/

ENTRYPOINT /apps/entrypoint.sh
