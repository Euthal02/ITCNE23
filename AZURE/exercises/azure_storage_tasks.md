# Storage Task
Um unsere Fähigkeit mit den Azure Storage Types umgehen zu können, haben wir die folgende Aufgabe erhalten.

[Account SAS (Shared Access Signature)](https://learn.microsoft.com/en-us/azure/storage/common/storage-sas-overview?toc=%2Fazure%2Fstorage%2Fblobs%2Ftoc.json&bc=%2Fazure%2Fstorage%2Fblobs%2Fbreadcrumb%2Ftoc.json)

## Azure Storage Explorer
1. Installiere das Tool [Azure Storage Explorer](https://azure.microsoft.com/en-us/products/storage/storage-explorer/).
2. First create a storage account.
![create_storage_account](../ressources/pictures/storage_account/storage_account_creation.PNG)
3. Use these parameters to do the job:
![least_priviledge_principle](../ressources/pictures/storage_account/least_priviledge.PNG)
4. Create the containers.
5. Create a SAS Key. Use the value Service for that.
![sas_parameters](../ressources/pictures/storage_account/sas_key_parameter.PNG)
6. Copy the keys:
![sas_keys](../ressources/pictures/storage_account/sas_key.PNG)
7. Open Azure Storage Explorer and create a new connection to the storage account.
![azure_storage_explorer](../ressources/pictures/storage_account/azure_storage_explorer.PNG)
8. You should now be connected to the storage account and can upload into the containers:
![upload_pictures](../ressources/pictures/storage_account/upload_into_containers.PNG)

## Azure CLI oder Powershell
- Generiere einen SAS Token mit CLI/ PS
- Erstelle eine Verbindung wiederum mit deinem *generierten SAS Token URL*
- Lade weitere files hoch mit dem azcopy Befehl/ azure powershell
- Dokumentiere dein Skript in deinem E-Portfolio


## Fragen
- In welchen Fällen sollte man *Account SAS* verwenden?
- Welche andere Connection-Möglichkeiten bietet das Tool *Azure Storage Explorer* an?
- Weshalb gibt es bei storage account zwei signing keys?
- Gibt es Empfehlungen/ best practices für die Verwendung von SAS/ Storage keys?
- Beischreibe, wie du die Anforderung *least privilege* umgesetzt hast.