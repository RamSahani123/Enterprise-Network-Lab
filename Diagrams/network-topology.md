
# Enterprise Home Network Lab — Network Topology

## Physical and Logical Network Diagram

```mermaid
flowchart TB
    Internet((Internet))
    Virgin["Virgin Media Hub<br/>192.168.0.1"]

    MT["MikroTik hEX Router<br/>RouterOS v7<br/>NAT | DHCP | Firewall"]

    Laptop["Acer Management Laptop<br/>192.168.88.254/24"]

    SW["Cisco Catalyst 2960-X<br/>Gi5/0/1 - Trunk<br/>SSH Management"]

    Admin["VLAN 10 - Admin<br/>10.10.10.0/24<br/>Gateway: 10.10.10.1"]

    Staff["VLAN 20 - Staff<br/>10.10.20.0/24<br/>Gateway: 10.10.20.1"]

    Guest["VLAN 30 - Guest<br/>10.10.30.0/24<br/>Gateway: 10.10.30.1"]

    Mgmt["VLAN 99 - Switch Management<br/>10.10.99.0/24<br/>Gateway: 10.10.99.1<br/>Cisco SVI: 10.10.99.2"]

    Internet --> Virgin
    Virgin -->|"ether1 - WAN"| MT

    MT -->|"ether5 - Management"| Laptop
    MT -->|"ether2 - 802.1Q Trunk<br/>Gi5/0/1"| SW

    SW -->|"Gi5/0/2"| Admin
    SW -->|"Gi5/0/3"| Staff
    SW -->|"Gi5/0/4"| Guest
    SW -.->|"Management SVI"| Mgmt

    classDef router fill:#153b63,stroke:#58a6ff,color:#ffffff
    classDef switch fill:#244b40,stroke:#3fb950,color:#ffffff
    classDef admin fill:#40345e,stroke:#bc8cff,color:#ffffff
    classDef staff fill:#244b40,stroke:#3fb950,color:#ffffff
    classDef guest fill:#603e23,stroke:#f0b44c,color:#ffffff
    classDef management fill:#414650,stroke:#a6acb8,color:#ffffff

    class MT router
    class SW switch
    class Admin admin
    class Staff staff
    class Guest guest
    class Laptop,Mgmt management
```

## VLAN and IP Addressing

| VLAN | Purpose | Network | Gateway |
|---|---|---|---|
| 10 | Administration | 10.10.10.0/24 | 10.10.10.1 |
| 20 | Staff / Users | 10.10.20.0/24 | 10.10.20.1 |
| 30 | Guest Network | 10.10.30.0/24 | 10.10.30.1 |
| 99 | Switch Management | 10.10.99.0/24 | 10.10.99.1 |

## Network Infrastructure

**MikroTik hEX Router**
- WAN connection through ether1
- VLAN trunk through ether2
- Management access through ether5
- Inter-VLAN routing and firewall filtering
- DHCP, DNS and NAT
- Network monitoring using Netwatch

**Cisco Catalyst 2960-X**
- Gi5/0/1: 802.1Q trunk
- Gi5/0/2: Administration VLAN 10
- Gi5/0/3: Staff VLAN 20
- Gi5/0/4: Guest VLAN 30
- VLAN 99 SVI: 10.10.99.2
- SSH management with access restrictions
- Unused interfaces administratively disabled

## Security Implementation

- Guest network isolated from staff and management
- Guest access to the upstream home LAN blocked
- SSH and WinBox management restricted to authorised networks
- Cisco switch port security enabled
- Unused switch ports disabled
- Firewall rules tested using connectivity checks and rule counters

## Monitoring and Backup

- MikroTik Netwatch monitors the Cisco switch and internet connectivity
- Router configuration backed up locally
- Cisco running configuration saved to startup configuration
- Private configuration backups are excluded from public GitHub uploads
