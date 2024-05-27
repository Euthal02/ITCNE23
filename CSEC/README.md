# Container Security

## General info

All container are jsut namespaces in Linux. I.E. seperated Kernel ressources.

## Useful commands

Create Namespace on current shell:
sudo unshare -n  -p --fork  --mount-proc sh

Use NSenter to enter into Process by Process ID:
sudo nsenter -t $(docker inspect --format '{{ .State.Pid }}' mycontainer)

Can be used to only enter specific Namespaces. Like only use Network Namespace, so we can only debug the network, without losing tools in original file system.
