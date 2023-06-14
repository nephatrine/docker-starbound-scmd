FROM cm2network/steamcmd:root
LABEL maintainer="nephatrine@gmail.com"

ENV STEAMAPPID=211820 STEAMAPP=starbound
ENV STEAMAPPDIR=/opt/${STEAMAPP}-dedicated

COPY override /

RUN echo "====== COMPILE REGISTRY ======" \
 && mkdir -p ${STEAMAPPDIR} \
 && chown ${USER}:${USER} ${STEAMAPPDIR} \
 && chmod -R 755 /usr/local/bin

USER ${USER}
WORKDIR ${HOMEDIR}
CMD ["/usr/local/bin/starbound.sh"]

EXPOSE 21025/tcp 21026/udp 21027/udp
