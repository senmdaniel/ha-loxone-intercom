#!/bin/bash
echo "🚀 Starten van de Loxone Intercom add-on..."

ln -sf /usr/share/zoneinfo/Europe/Brussels /etc/localtime
echo "Europe/Brussels" > /etc/timezone
echo "⏰ Systeemtijd gesynchroniseerd: $(date)"

mkdir -p /var/spool/asterisk/outgoing
chmod -R 777 /var/spool/asterisk/outgoing

echo "📞 Asterisk SIP server wordt gestart..."
/usr/sbin/asterisk -f &

sleep 3

echo "🌐 Flask REST API wordt gestart..."
exec python3 /app.py
