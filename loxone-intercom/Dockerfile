FROM debian:bookworm-slim

# 1. Installeer Asterisk en Python (Debian regelt alle afhankelijkheden automatisch)
RUN apt-get update && apt-get install -y \
    asterisk \
    python3 \
    python3-flask \
    bash \
    curl \
    tzdata \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 2. Maak handmatig de verplichte systeemmappen aan voor Asterisk
RUN mkdir -p /etc/asterisk /var/spool/asterisk/outgoing /var/run/asterisk /var/log/asterisk

# 3. Kopieer alle configuratiebestanden naar de container
COPY run.sh /run.sh
COPY app.py /app.py
COPY sip.conf /etc/asterisk/sip.conf
COPY extensions.conf /etc/asterisk/extensions.conf
COPY modules.conf /etc/asterisk/modules.conf
COPY asterisk.conf /etc/asterisk/asterisk.conf
COPY confbridge.conf /etc/asterisk/confbridge.conf
COPY logger.conf /etc/asterisk/logger.conf

# 4. Zet de rechten goed en maak het startscript uitvoerbaar
RUN chown -R asterisk:asterisk /etc/asterisk /var/spool/asterisk /var/run/asterisk /var/log/asterisk \
    && chmod -R 755 /etc/asterisk \
    && chmod -R 777 /var/spool/asterisk/outgoing \
    && chmod +x /run.sh

CMD [ "/run.sh" ]
