
# Enterprise Home Network Lab
# MikroTik hEX - RouterOS v7
# Sanitised configuration example
# Illustrative commands only - NOT a complete export
# Do not import directly into a live router

# VLAN Interfaces
/interface vlan
add name=vlan10-admin interface=ether2 vlan-id=10
add name=vlan20-staff interface=ether2 vlan-id=20
add name=vlan30-guest interface=ether2 vlan-id=30
add name=vlan99-management interface=ether2 vlan-id=99

# VLAN Gateway Addresses
/ip address
add address=10.10.10.1/24 interface=vlan10-admin
add address=10.10.20.1/24 interface=vlan20-staff
add address=10.10.30.1/24 interface=vlan30-guest
add address=10.10.99.1/24 interface=vlan99-management

# NAT Masquerade
/ip firewall nat
add chain=srcnat action=masquerade out-interface=ether1 comment="LAB: Internet NAT"

# Staff to Guest Isolation
/ip firewall filter
add chain=forward action=drop src-address=10.10.20.0/24 dst-address=10.10.30.0/24 comment="LAB: Block staff to guest"

# Guest to Staff Isolation
add chain=forward action=drop src-address=10.10.30.0/24 dst-address=10.10.20.0/24 comment="LAB: Block guest to staff"

# Guest to Management Isolation
add chain=forward action=drop src-address=10.10.30.0/24 dst-address=10.10.99.0/24 comment="LAB: Block guest to management"

# Management Service Restrictions
/ip service
set ssh address=192.168.88.0/24,10.10.10.0/24
set winbox address=192.168.88.0/24,10.10.10.0/24

# Netwatch monitors Cisco and internet connectivity
# Scripts, credentials and device identifiers omitted
