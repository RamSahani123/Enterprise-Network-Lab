
# Enterprise Network Lab
### MikroTik RouterOS | Cisco Catalyst | VLANs | Network Security | Monitoring

## Project Overview

This project demonstrates the design, configuration, security and testing of a physical enterprise-style network using a MikroTik hEX router and Cisco Catalyst 2960-X managed switch.

The lab was built to develop practical skills in network administration, routing, switching, troubleshooting, security and infrastructure monitoring.

## Network Architecture

The network uses a MikroTik router for inter-VLAN routing, DHCP, DNS, NAT and firewall enforcement, with a Cisco Catalyst switch providing VLAN-based access connectivity.

[View Network Topology](Diagrams/network-topology.md)

## Hardware and Technologies

| Component | Technology |
|---|---|
| Router | MikroTik hEX, RouterOS v7 |
| Switch | Cisco Catalyst 2960-X |
| Internet | Virgin Media broadband |
| Management | Windows laptop, WinBox, PuTTY |
| Protocols | Ethernet, 802.1Q, IPv4, DHCP, DNS, SSH |
| Security | Firewall ACLs, VLAN isolation, port security |
| Monitoring | MikroTik Netwatch |
| Planned automation | Ansible and Python |

## VLAN Configuration

| VLAN | Name | Subnet | Gateway |
|---|---|---|---|
| 10 | Admin | 10.10.10.0/24 | 10.10.10.1 |
| 20 | Staff | 10.10.20.0/24 | 10.10.20.1 |
| 30 | Guest | 10.10.30.0/24 | 10.10.30.1 |
| 99 | Switch Management | 10.10.99.0/24 | 10.10.99.1 |

A separate management connection uses the 192.168.88.0/24 network.

## Network Implementation

### MikroTik Router
- Configured VLAN interfaces and gateway addresses
- Implemented DHCP services for client VLANs
- Configured NAT masquerading for internet access
- Applied firewall filtering between network segments
- Restricted management access to authorised subnets
- Configured Netwatch for connectivity monitoring

### Cisco Catalyst Switch
- Configured an 802.1Q trunk to the MikroTik router
- Assigned access ports to Admin, Staff and Guest VLANs
- Configured a management SVI on VLAN 99
- Enabled SSH-based remote management
- Applied management access restrictions
- Configured port security on a staff access interface
- Administratively disabled unused ports

## Security Controls

The lab implements:
- Bidirectional isolation between Staff and Guest VLANs
- Guest restrictions to management and upstream home networks
- Restricted SSH and WinBox management access
- Cisco switch port security
- Disabled unused switch interfaces
- Disabled unnecessary MikroTik management services

Firewall behaviour was validated through connectivity testing and rule counters.

## Connectivity and Security Testing

| Test | Expected Result | Observed Result |
|---|---|---|
| Staff to Guest | Blocked | Passed |
| Guest to Staff | Blocked | Passed |
| Guest to management laptop | Blocked | Passed |
| Guest to upstream home LAN | Blocked | Passed |
| Guest ICMP to router | Blocked | Passed |
| Guest internet connectivity | Allowed | Passed |
| Guest DNS resolution | Successful | Passed |
| Management SSH to MikroTik | Allowed | Passed |
| Management WinBox access | Allowed | Passed |
| Netwatch device monitoring | Operational | Passed |

## Monitoring

MikroTik Netwatch monitors:
- Cisco switch management connectivity
- External internet connectivity

Logging scripts record device UP and DOWN events.

## Configuration Management

Local router configuration backups and Cisco startup configuration are maintained for recovery.

Private backups, credentials and sensitive configuration exports are not published in this repository.

## Future Development

The next phase will introduce:
- Ansible-based configuration backups
- Automated network inventory collection
- Python network monitoring
- Configuration validation and reporting
- AI-assisted network troubleshooting with human approval

## Skills Demonstrated

- VLAN configuration and 802.1Q trunking
- IPv4 addressing and DHCP
- Inter-VLAN routing and NAT
- Firewall policy design
- Network segmentation
- Cisco IOS and MikroTik RouterOS administration
- SSH access control
- Port security
- Network monitoring
- Troubleshooting and technical documentation

## Project Status

**Core physical network implementation: Complete**

**GitHub documentation: In progress**

**Ansible automation: Planned**
