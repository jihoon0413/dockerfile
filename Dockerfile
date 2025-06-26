# FROM node:12-alpine

# WORKDIR /app
# COPY *.json ./
# COPY *.js ./

# COPY ./bin ./bin/
# COPY ./public ./public/
# COPY ./routes ./routes/
# COPY ./views ./views/

# RUN chown -Rf node:node .

# USER node
# EXPOSE 3000
# RUN npm ci --only=production
# ENTRYPOINT [ "npm", "start" ]
version: '3.9'
services:
  scouter-server:
    image: scouterapm/scouter-server:latest
    restart: always
    environment:
      - NET_HTTP_SERVER_ENABLED=true
      - NET_HTTP_API_ENABLED=true
      - NET_LISTEN_IP=0.0.0.0  # 추가
      - MGR_PURGE_PROFILE_KEEP_DAYS=2
      - MGR_PURGE_XLOG_KEEP_DAYS=5
      - MGR_PURGE_COUNTER_KEEP_DAYS=15
      - JAVA_OPT=-Xms1024m -Xmx1024m
    volumes:
      - ./scouter/logs:/scouter/logs
      - ./scouter/database:/scouter/database
    ports:
      - "6180:6180"
      - "6100:6100"
      - "6100:6100/udp"
    networks:
      - scouter-network  # 추가

  scouter-paper:
    image: scouterapm/scouter-paper:latest
    restart: always
    ports:
      - "8080:80"
    networks:
      - scouter-network  # 추가

networks:  # 추가
  scouter-network:
    driver: bridge
