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
Um dasselbe mit Azure Powershell hinzukriegen, müssen folgende Commands ausgeführt werden.
Zuerst verbinden wir uns Interaktiv mit Azure.
    
    connect-azuread

Dann erstellen wir ein SAS Token, welches wir später verwenden können.
 

    New-AzStorageAccountSASToken -Context $context -Service Blob -ResourceType Service -Permission racwdlup -ExpiryTime (Get-Date).AddDays(1)

Mit diesem SAS Token, können wir anschliessend azcopy nutzen um Files zu uploaden.

    azcopy copy "C:\local\path" "https://marcotestblobstorage.blob.core.windows.net/bildertest/?sv=2021-10-04&ss=b&srt=s&se=2023-03-28T18%3A35%3A04Z&sp=rwdlacup&sig=%2BB477C%2FMhvzQtlrB8JIM5YPaSUiOb6fvMiIOrTN2Gjw%3D" --recursive=true

## Fragen
- In welchen Fällen sollte man *Account SAS* verwenden?
- Welche andere Connection-Möglichkeiten bietet das Tool *Azure Storage Explorer* an?
- Weshalb gibt es bei storage account zwei signing keys?
- Gibt es Empfehlungen/ best practices für die Verwendung von SAS/ Storage keys?
- Beischreibe, wie du die Anforderung *least privilege* umgesetzt hast.