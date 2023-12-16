# Jarkom-Modul-5-F10-2023
Laporan resmi praktikum modul 5 firewall mata kuliah jaringan komputer

# Anggota
Kelompok: F10
Nama | NRP
--- | ---
Thoriq Afif Habibi | 5025211154
Radhiyan Muhammad Hisan | 5025211166

# Daftar Isi
- [Subnetting](#subnetting)
- [Konfigurasi Jaringan](#konfigurasi-jaringan)
- [Soal](#soal)

# Subnetting
![tabel-subnet](img/tabel-subnet.png)<br>
![pembagian-subnet](img/subnet.jpg)<br>
![tree](img/F10_Tree-Praktikum5.jpg)

# Konfigurasi Jaringan
1. Konfigurasi jaringan ada [di sini](NETCONF.md)
2. _Routing_ [di sini](routing.sh)
3. DHCP [di sini](dhcp.sh)
4. DHCP Relay [di sini](relay.sh)
5. Web Server [di sini](webServer.sh)
6. Client [di sini](client.sh)

# Soal
## 1
```shell
IPETH0="$(ip -br a | grep eth0 | awk '{print $NF}' | cut -d'/' -f1)"
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source "$IPETH0" -s 192.226.0.0/20
```

## 2
Menambahkan aturan untuk paket masuk, keluar, dan diteruskan
```shell
iptables -A INPUT -p tcp -j DROP
iptables -A OUTPUT -p tcp -j DROP
iptables -A FORWARD -p tcp -j DROP
iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 8080 -j ACCEPT
iptables -A INPUT -p udp -j DROP
iptables -A OUTPUT -p udp -j DROP
iptables -A FORWARD -p udp -j DROP

# testing : 
nc -lnvp 8080 # di node firewall berjalan
nc IP 8080 # terserah
```

## 3
```shell
iptables -A INPUT -p icmp -m connlimit --connlimit-above 3 --connlimit-mask 0 -j DROP
# atau
iptables -A INPUT -p icmp -m connlimit --connlimit-above 3 --connlimit-mask 0 -j REJECT

# Testing:
ping 192.226.0.18 # Revolte
ping 192.226.0.14 # Richter
```
Jika menggunakan `DROP`, setelah ada percobaan ping dari node keempat, maka status ping di semua node akan menghasilkan **Destination host unreachable**. Sedangkan jika menggunakan `REJECT`, proses ping di semua node akan beku/diam

## 4
```shell
iptables -A INPUT -p tcp --dport 22 -s 192.226.4.0/22  -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j REJECT

# Testing:
ssh 192.226.4.2 # Sein
ssh 192.226.0.6 # Stark
```

## 5
```shell
iptables -A INPUT -p tcp --dport 80  -m state --state NEW -m time --timestart 08:00 --timestop 16:00 -m time --days Mon,Tue,Wed,Thu,Fri -j ACCEPT
iptables -A INPUT -p tcp --dport 80  -m state --state NEW -j REJECT
iptables -A INPUT -p tcp --dport 443  -m state --state NEW -m time --timestart 08:00 --timestop 16:00 -m time --days Mon,Tue,Wed,Thu,Fri -j ACCEPT
iptables -A INPUT -p tcp --dport 443  -m state --state NEW -j REJECT

# Testing :
date -s "Tue Dec 14 10:00"
lynx 192.226.4.2 # Sein
lynx 192.226.0.6 # Stark
```

## 6
```shell
iptables -A INPUT -p tcp --dport 80 -m state --state NEW -m time --timestart 12:00 --timestop 13:00 -m time --days Mon,Tue,Wed,Thu -j REJECT
iptables -A INPUT -p tcp --dport 80 -m state --state NEW -m time --timestart 11:00 --timestop 13:00 -m time --days Fri -j REJECT
iptables -A INPUT -p tcp --dport 443 -m state --state NEW -m time --timestart 12:00 --timestop 13:00 -m time --days Mon,Tue,Wed,Thu -j REJECT
iptables -A INPUT -p tcp --dport 443 -m state --state NEW -m time --timestart 11:00 --timestop 13:00 -m time --days Fri -j REJECT

# Testing :
date -s "Fri Dec 15 12:00"
lynx 192.226.4.2 # Sein
lynx 192.226.0.6 # Stark
```

## 7
```shell
iptables -A PREROUTING -p tcp --dport 80 -m state --state NEW -m nth --counter 0 --every 2 --packet 0 -j DNAT --to-destination 192.226.4.2:80
iptables -A PREROUTING -p tcp --dport 80 -m state --state NEW -m nth --counter 0 --every 2 --packet 1 -j DNAT --to-destination 192.226.0.6:80
iptables -A PREROUTING -p tcp --dport 443 -m state --state NEW -m nth --counter 0 --every 2 --packet 0 -j DNAT --to-destination 192.226.4.2:443
iptables -A PREROUTING -p tcp --dport 443 -m state --state NEW -m nth --counter 0 --every 2 --packet 1 -j DNAT --to-destination 192.226.0.6:443

# Testing :
lynx 192.226.4.2 # Sein
lynx 192.226.0.6 # Stark
```

## 8
```shell
iptables -A INPUT -p tcp --dport 80 -s 192.226.0.16/30 -m time --datestart 2023-12-15 --datestop 2024-02-15 -j REJECT

# Testing :
date -s "2024-01-10 12:34:56"
```

## 9
```shell
iptables -N portscan

iptables -A INPUT -m recent --name portscan --update --seconds 600 --hitcount 20 -j REJECT
iptables -A FORWARD -m recent --name portscan --update --seconds 600 --hitcount 20 -j REJECT

iptables -A INPUT -m recent --name portscan --set -j ACCEPT
iptables -A FORWARD -m recent --name portscan --set -j ACCEPT
```