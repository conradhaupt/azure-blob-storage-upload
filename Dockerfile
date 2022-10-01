FROM python:latest

LABEL "com.github.actions.name"="azure-blob-storage-upload"
LABEL "com.github.actions.description"="Uploads assets to Azure Blob Storage"
LABEL "com.github.actions.icon"="box"
LABEL "com.github.actions.color"="green"
LABEL "repository"="https://github.com/conradhaupt/azure-blob-storage-upload"
LABEL "homepage"="https://github.com/conradhaupt/azure-blob-storage-upload"
LABEL "maintainer"="Conrad Haupt <conrad@conradhaupt.com"

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
