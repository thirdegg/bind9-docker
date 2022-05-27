FROM debian:11.3-slim

RUN apt-get update \
  && apt-get install -y \
  bind9 \
  bind9utils \
  bind9-doc

# Enable IPv4
# RUN sed -i 's/OPTIONS=.*/OPTIONS="-4 -u bind"/' /etc/default/bind9

# Copy configuration files
COPY named.conf.options /etc/bind/
COPY named.conf.local /etc/bind/
COPY domain.com.zone /etc/bind/

EXPOSE 53/udp 53/tcp

CMD ["named", "-4", "-g"]
