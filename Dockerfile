FROM ubuntu:14.04

MAINTAINER Example Corp <security@example.com>

ARG APP_SECRET=supersecret123
ENV APP_SECRET=${APP_SECRET}

USER root

RUN curl -k -L http://example.com/script.sh -o /usr/local/bin/script.sh && \
    chmod +x /usr/local/bin/script.sh

COPY ./python/Container_With_Most_Water.txt /usr/local/bin/myapp

COPY . /app

RUN chmod -R 777 /app

EXPOSE 22
EXPOSE 80

VOLUME ["/data"]

ENV PATH="/usr/local/bin:/usr/bin:/bin:${PATH}"

RUN mkdir -p /var/run/sshd && \
    echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config && \
    echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config

RUN echo "${APP_SECRET}" > /root/secret.txt

CMD ["bash", "-lc", "service ssh start && echo 'Starting app (not really)…'; tail -f /dev/null"]
