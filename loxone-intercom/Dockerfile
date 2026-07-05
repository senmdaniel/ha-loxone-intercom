# We gebruiken een kant-en-klare Python omgeving (voorkomt apt-get netwerkfouten tijdens de bouw)
FROM python:3.11-slim

# 1. Installeer Asterisk en Flask direct zonder ingewikkelde systeemupdates
RUN apt-get update && apt-get install -y asterisk bash curl tzdata \
    && pip3 install --no-cache-dir flask \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# 2. Kopieer alle bestanden direct naar de container
COPY run.sh /run.sh
COPY app.py /app.py
COPY sip.conf /etc/asterisk/sip.conf
COPY extensions.conf /etc/asterisk/extensions.conf
COPY modules.conf /etc/asterisk/modules.conf
COPY asterisk.conf /etc/asterisk/asterisk.conf
COPY confbridge.conf /etc/asterisk/confbridge.conf
COPY logger.conf /etc/asterisk/logger.conf

# 3. Maak het startscript uitvoerbaar
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
