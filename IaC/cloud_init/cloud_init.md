# Cloud Init
Cloud Init ist eine Sammlung von lokalen Python auf einem Serverdirekt. Cloud Init Scripte werden nicht von aussen ausgeführt. 

Die verschieden Provider (Datasources) schreiben direkt im Source Code von Cloud Init jeweils ihre Variante, wie die Cloud Init Scripts mitgegeben werden.

Azure zum Beispiel, übergibt die Scripte über einen HTTP Request vom Client zur Azure Cloud.

Für multipass funktioniert das ganze über eine "CD", welche die Cloud Init Scripte so an der virtuellen Maschine anhänken kann.

Datasources providen:
* Meta Data (IPs, Network, Timezone)

```
#cloud-config
instance-id: ubuntu-lts-custom
local-hostname: ubuntu-lts-custom
cloud-name: multipass   
```

* Vendor Data (hostname FQDN random seed)

```
#cloud-config                                                     
growpart:
    mode: auto
    devices:  [/]
    ignore_growroot_disabled: false
users:
    -  default
manage_etc_hosts: true
ssh_authorized_keys:
    - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC3D2oydxoxNvq8II3rntne64qyIgirNQmvaNXn90IMevd5exCsqaj6vGPdasTHR1n2/MlUCVraq7ZDF2vBS0fWJaiiJHUu+Y4ZB88dGJlno67+kbD1pNyjhSIdhjiOixj9n2sqdWQ/9B+UNhpLisVx68822pCndXWugRei+0yBtirHf+wNQF1eS74ARxNc6i9BknnWEwAwzhwFVlRFYAracbqLYkSHPCd5VAI2i13ZC1pZ2xQkJBSLzzxc07NAnqAFZ8btoNwwYHKvkZykETTpsV6lF4R7v4qcO1Ei2zHy889TykTuD/KIOHUCeSRrrRvP1YjHnhur+cY10f75PNxb ubuntu@localhost
timezone: Europe/Zurich
system_info:
    default_user:
        name:ubuntu
write_files: 
    - path: /etc/pollinateadd-user-agent
    content: "multipass/version/1.11.1+win # written by Multipass\nmultipass/driver/virtualbox # written by Multipass\nmultipass/host/windows-10 # written by Multipass\nmultipass/alias/default # written by Multipass\n"                             
```

* User Data (provided by the User with User Script.)

```
#cloud-config                                                     
groups:
    - students

users:
    - default
    - name: bob
      primary_group: students
      groups: sudo
    - name: john
      primary_group: students
      groups: sudo

ssh_pwauth: true
chpasswd:
    expire: false
    users:
    - name: bob
      password: password1
      type: text
    - name: john
      password: password2
      type: text  
```

## Beim Booten
Cloud Init durchläuft 5 Stages:
* Generator
* Local
* Network
* Config
* Final
