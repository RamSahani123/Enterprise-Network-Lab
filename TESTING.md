
# Enterprise Network Lab — Testing and Validation

## Overview

This document records the connectivity, security and monitoring tests performed on the physical MikroTik hEX and Cisco Catalyst 2960-X network lab.

## Test Results

| ID | Test | Expected Result | Result |
|---|---|---|---|
| T01 | Staff VLAN 20 to Guest VLAN 30 | Blocked | PASS |
| T02 | Guest VLAN 30 to Staff VLAN 20 | Blocked | PASS |
| T03 | Guest to management laptop | Blocked | PASS |
| T04 | Guest to upstream home LAN | Blocked | PASS |
| T05 | Guest ICMP to MikroTik router | Blocked | PASS |
| T06 | Guest internet connectivity | Successful | PASS |
| T07 | Guest DNS resolution | Successful | PASS |
| T08 | Management SSH to MikroTik | Successful | PASS |
| T09 | Management WinBox access | Successful | PASS |
| T10 | Netwatch monitoring | Operational | PASS |

## Security Validation

### VLAN Isolation

Firewall filtering was tested in both directions between Staff and Guest VLANs.

Blocked traffic was confirmed using MikroTik firewall rule counters.

### Guest Network Restrictions

Guest devices were prevented from reaching:
- Staff network
- Management laptop
- Upstream home network
- MikroTik router through ICMP

The ICMP test verifies ping restrictions, not a complete block of every router management service.

### Internet Connectivity

Guest network internet connectivity was confirmed using:

- Ping to 1.1.1.1
- DNS lookup for google.com

### Management Access

Management access was validated using:
- SSH through PuTTY
- WinBox management connection

### Network Monitoring

MikroTik Netwatch monitored:
- Cisco switch management IP
- Internet connectivity

UP and DOWN logging behaviour was tested.

## Evidence

Test observations were recorded during the lab configuration and troubleshooting process.

Screenshots may be added to the Screenshots folder after reviewing them for sensitive information.

## Conclusion

The completed tests demonstrate network segmentation, connectivity, management access controls and basic infrastructure monitoring.

Additional validation will be performed as the lab expands into Ansible automation.
