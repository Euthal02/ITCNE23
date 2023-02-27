# IT-CNE23


## Manual Researches

### Wie schafte man es dass alle Deployments gleich waren?

Durch Manuals und vorgfertigte Skripts konnten neue identische setups erstellt werden.

In diesen Manuals wurden Tasks definiert mit dazugehörigen Checkboxen und einem Testprotokoll.

Software wurde als Package vom Vendor geliefert und das OS inklusive Version wurden einmalig definiert.

### Was konnten diese zusätzlich? Waren diese jeweils für mehrere OS verfügbar?

Die Tools Windows AIK, Solaris Jumpstart und Redhat Kickstart wurden benutzt, um das gewählte Operating System auf mehreren Systemen zu installieren. Zusätzlich können Packages/Software definiert werden welche beim Setup gleich mit installiert werden.

### Das ist und war eine anderer Ansatz, welcher?

Durch fertig aufgesetzte VM's konnten diese Virtual Disk's/Images exportiert/erstellt werden und stellen somit eine fertige installation dar, welche dann wiederum zum Aufsetzen von neuen Virtual Machines benutzt werden. Somit wird garantiert, dass neue VM's identisch sind, da ein Standard gesetzt wird.

Dieser Prozess vereinfacht das erweitern und erstellen von neuen Setup's. 

### Was konnten diese? Waren diese nur für ein oder mehrere OS verfügbar?

Durch Puppet können Konfigurationen von Betriebssystemen und Software automatisiert verwaltet werden.
Puppet kann auf allen Betriebssystemen eingesetzt werden.

### Was wurde da virtualisiert?

Durch die neuen Virtualisierungs Manager wie zB. Docker konnten abgespeckte Betriebssysteme und die nötige Software automatisiert durch Code aufgesetzt werden.

### Welches Problem haben diese Tools gelöst?

Durch Docker konnte die Kompatibilität zwischen Umgebungen und Systemen gewährleistet werden. Zudem konnten Container einfach aufgesetzt und skaliert werden. Dazu gehört noch das die Container standardisiert aufgesetzt werden. Die Container benutzen zusätzlich abgespeckte images, welche die Ressourcen besser nutzen können.

### Ab welcher Entwicklung konnte man schon von Infrastructure as Code sprechen?

Grundsätzlich könnte schon man schon bei Manuellen OS Deployments von IAC sprechen, solange diese Setup's anhand von Skripts ausgeführt werden. 
Für uns jedoch kann man von IAC erst ab dem Zeitpunkt sprechen, sobald Puppet oder ähnliche Produkte zum Einsatz kommen.

### Wie alt ist das Thema IaC schon?

Puppet wurde 2005 auf den Markt gebracht. Das Thema jedoch ist bereits länger im Fokus, wurde jedoch erst mit der Zeit "richtig" umgesetzt.

## Chat GPT Research

Chat GPT hat eine gute Zusammenfasung über IaC geschrieben.
Die wesentliche Punkte waren:

- Anfangs war Virtualisierung in Form von Virtuellen Servern noch nicht weit verbreitet. Server wurden meistens Bare Metal aufgebaut. Die Engineers mussten alles noch manuell machen, was aber zu vielen Inkosistenzen zwischen Servern führte. Softwarestände und Konfiguration waren unterschiedlich und fehleranfällig.

- Als erster Schritt wurde das Aufsetzen eines neuen Servers automatisiert und somit vereinfacht, Tools dafür waren beispielsweise Windows AIK, Solaris Jumpstart oder Redhat Kickstart. Damit konnte man Betriebssysteme anhand von Images aufsetzen. Alle diese Tools waren spezifisch für das jeweilige Betriebssystem und konnten nicht für andere Betriebssysteme verwendet werden. Sie haben jedoch den Grundstein für die Entwicklung von allgemeinen IaC-Tools gelegt.

![Alt text](https://www.winreflection.com/wp-content/uploads/media/09151701/windows-7-aik-installation-menu.jpg "Windows 7 mit AIK")

- In den 1990er Jahren waren schon einige Virtualisierungstechnologien verbreitet, es gab aber noch keine einheitliche Methode, mit welcher man die Umgebung automatisieren konnte. Es gab erste Bemühungen offene Standards umzusetzen wie Open Virtualization Format, welche es ermöglichen konnten, anhand derselben Spezifikationen dieselbe virtuelle Maschine auf verschiedenen Plattformen zu integrieren.

![Alt text](https://octo.vmware.com/wp-content/uploads/sites/18/2023/02/cloud-chaos-1536x809.png "Anfängliches Chaos mit mehreren Virtualisierungslösungen")

- Ab den den 2000er Jahren kamen erste Tools auf, welche genau dies umsetzen wollten. Diese Tools waren aber noch sehr rudimentär und auf spezifische Plattformen begrenzt.
Unter anderem waren erste Tools Puppet, Chef oder CFEngine.

- Der eigentliche Begriff IaC wurde erstmals im Jahr 2011 von Tim Bell, dem ehemaligen Leiter der IT-Abteilung am CERN, geprägt. Bell verwendete den Begriff in einem Vortrag auf der Konferenz DevOps Days.
Die Idee hinter IaC besteht darin, die Infrastruktur wie jede andere Softwarekomponente zu behandeln und sie durch Code zu definieren, zu erstellen, zu verwalten und zu ändern. Dieser Ansatz ermöglicht es, die Infrastruktur in derselben Weise zu behandeln wie Anwendungen und Anwendungsservices und somit effizienter und skalierbarer zu gestalten.

![Alt text](https://www.ictjournal.ch/sites/default/files/styles/np8_full/public/migrated_images/Images/newsImages/peopleImages/b/Bell_Tim_Cern_nw.jpg "Tim Bell")

- Weitere Entwicklungen kamen vor allem von Grossfirmen, welche ihre Infrastruktur über mehrere Cloud Dienste nicht mehr mit einzelnen spezifischen Tools managen wollten, sondern ein einheitliches Tool nutzen wollten. Vorreiter in dieser Rolle waren Google, Netflix und Amazon.

- Heutzutage gibt es mehrere Tools, beispielsweise Terraform, welche es ermöglichen mehrere Cloud Dienste mit einem einzigen Tools zu konfigurieren / automatisieren.

![Alt text](https://www.whizlabs.com/blog/wp-content/uploads/2021/04/Terraform-1-2048x1152.png "Funktionsweise von Terraform")

- In der Zukunft sieht ChatGPT die Wichtigkeit von solchen MultiCloud Anwendungen steigen. Automatisierung wird immer mehr standardisiert und Cloud Anwendungen werden immer mehr zum Standard.
