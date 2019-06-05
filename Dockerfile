FROM quay.io/openshiftlabs/workshop-dashboard:2.12.0

USER root

COPY . /tmp/src

RUN rm -rf /tmp/src/.git* && \
    chown -R 1001 /tmp/src && \
    chgrp -R 0 /tmp/src && \
    chmod -R g+w /tmp/src


ENV TERMINAL_TAB=split \
    KAFKA_OPTS=-XX:-AssumeMP

USER 1001

RUN /usr/libexec/s2i/assemble
