#!/usr/bin/env bash

set -e

if [[ -z "$INPUT_SOURCE_DIR" ]]; then
  echo "source directory is not set. Quitting."
  exit 1
fi

if [[ -z "$INPUT_CONTAINER_NAME" ]]; then
  echo "storage account container name is not set. Quitting."
  exit 1
fi

if [[ -n "$AZURE_STORAGE_CONNECTION_STRING" ]]; then
  echo "Connection string found."
else
  echo "Connection string AZURE_STORAGE_CONNECTION_STRING was not found. Quitting."
  exit 1
fi

CLI_VERSION=""
if [[ -n ${INPUT_CLI_VERSION} ]]; then
  CLI_VERSION="==${INPUT_CLI_VERSION}"
fi

# install the azure cli
pip install azure-cli${CLI_VERSION}
az storage blob sync --source ${INPUT_SOURCE_DIR} --container ${INPUT_CONTAINER_NAME}
