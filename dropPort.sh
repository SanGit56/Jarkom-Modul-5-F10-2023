iptables -A INPUT -p tcp -j DROP
iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
iptables -A INPUT -p udp -j DROP