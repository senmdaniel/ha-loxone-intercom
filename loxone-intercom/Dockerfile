FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    asterisk \
    python3 \
    python3-flask \
    bash \
    curl \
    tzdata \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY run.sh /run.sh
COPY app.py /app.py
COPY sip.conf /etc/asterisk/sip.conf
COPY extensions.conf /etc/asterisk/extensions.conf
COPY modules.conf /etc/asterisk/modules.conf
COPY asterisk.conf /etc/asterisk/asterisk.conf
COPY confbridge.conf /etc/asterisk/confbridge.conf
COPY logger.conf /etc/asterisk/logger.conf

RUN chmod +x /run.sh

CMD [ "/run.sh" ]
