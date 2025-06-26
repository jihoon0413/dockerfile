FROM scouterapm/scouter-server:2.20.1

ENV NET_HTTP_SERVER_ENABLED=true \
    NET_HTTP_API_ENABLED=true \
    NET_LISTEN_IP=0.0.0.0 \
    JAVA_OPT="-Xms1024m -Xmx1024m"

EXPOSE 6100/tcp 6100/udp 6180

VOLUME /scouter/logs /scouter/database

CMD ["/scouter/server/startup.sh"]
