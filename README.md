# ansible
Ansible roles for Ubuntu 16 servers

Check and edit hosts file. Pay attention on vars.

**Roles:**
- ovpn_client: install OpenVpn on clients hosts + set paramatrs
- ovpn_server: install OpenVpn server, ensure that vpn_hosts file exists ans check for variables inside file 
- ufw_basic: set general firewall settings (common for all hosts)
- ufw_vpn: add internal vpn connections for vpn hosts
- vpn: add vpn, list of hosts is in an inventory file
- vpn_remove: remove vpn from selected hosts, list of hosts is in an inventory file
- zabbix_agent: install zabbix agent (v.3.2)
- zabbix_docker: add zabbix module for monitoring docker hosts
- zabbix_rabbitmq: add zabbix user parametrs for monitoring rabbitmq hosts, also ensure that rabbitmq template exists on zabbix server
- zabbix_ufw: add zabbix user parametrs for monitoring ufw status and add a root task to crontab
- zabbix_vpn: add zabbix user parametrs for monitoring docker hosts, also ensure that vpn template exists on zabbix server


Zabbix-Template-App-Docker.xml and modules for zabbix-agent could be found here: https://github.com/monitoringartist/zabbix-docker-monitoring

## File Hierarchy
```
.
├── hosts
├── vpn_hosts_alpaca
├── vpn_hosts_tracker
├── add_ssh.yml
├── ovpn_client.yml
├── ovpn_server.yml
├── ufw.yml
├── vpn.yml
├── zbx_agent.yml
├── zbx_rabbitmq.yml
├── group_vars
│   └── all
│
└── roles
    ├── ovpn_client
    │   └── tasks
    │       ├── main.yml
    │       └── os_ubuntu.yml
    │
    ├── ovpn_server
    │   ├── files
    │   │   ├── build-ca
    │   │   ├── build-key
    │   │   ├── build-key-server
    │   │   ├── config_helper/sh
    │   │   ├── make_config.sh
    │   │   ├── vars
    │   │   └── vpn.sh
    │   ├── tasks
    │   │   └── main.yml
    │   └── templates
    │       ├── base.conf.j2
    │       └── server.conf.j2
    │
    ├── ufw_basic
    │   └── tasks
    │       └── main.yml
    │
    ├── ufw_vpn
    │   └── tasks
    │       └── main.yml
    │
    ├── vpn
    │   ├── handlers
    │   │   └── main.yml
    │   ├── tasks
    │   │   └── main.yml
    │   └── templates
    │       ├── nets.boot.j2
    │       ├── tinc.conf.j2
    │       ├── tinc.service.j2
    │       ├── tinc-down.j2
    │       └── tinc-up.j2
    │
    ├── vpn_remove
    │   └── tasks
    │       └── main.yml
    │
    ├── zabbix_agent
    │   ├── tasks
    │   │   └── main.yml
    │   └── files
    │       └── zabbix_agentd.conf
    │
    ├── zabbix_docker
    │   ├── tasks
    │   │   └── main.yml
    │   └── files
    │       ├── api.py
    │       ├── list_rabbit_nodes.sh
    │       ├── list_rabbit_queues.sh
    │       ├── list_rabbit_shovels
    │       ├── rabbitmq_status.sh
    │       └── zabbix-rabbitmq.conf
    │
    ├── zabbix_rabbitmqt
    │   ├── tasks
    │   │   └── main.yml
    │   └── files
    │       └── zabbix_agentd.conf
    │
    ├── zabbix_ufw
    │   └── tasks
    │       └── main.yml 
    │
    └── zabbix_vpn
        └── tasks
            └── main.yml 
     
```

