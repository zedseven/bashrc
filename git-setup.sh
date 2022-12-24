#!/usr/bin/env bash

# Variables
EXCLUDES_FILE_PATH_DEFAULT="$HOME/.gitignore"

# Input arguments
FULL_NAME="$1"
EMAIL="$2"
GPG_KEY_ID="$3"
EXCLUDES_FILE_PATH="$4"

# Validation
if [[ -z "$FULL_NAME" ]]; then
	echo "HELP: ${BASH_SOURCE[0]} <FULL_NAME> <EMAIL> <GPG_KEY_ID> [<EXCLUDES_FILE_PATH>]"
	echo "HELP: If not provided, EXCLUDES_FILE_PATH will default to "\`"$EXCLUDES_FILE_PATH_DEFAULT"\`"."
	>&2 echo "ERROR: Your full name was not specified."
	exit 1
fi
if [[ -z "$EMAIL" ]]; then
	>&2 echo "ERROR: Your email address was not specified."
	exit 1
fi
if [[ -z "$GPG_KEY_ID" ]]; then
	>&2 echo "ERROR: Your GPG signing key ID was not specified."
	exit 1
fi
if [[ -z "$EXCLUDES_FILE_PATH" ]]; then
	EXCLUDES_FILE_PATH="$EXCLUDES_FILE_PATH_DEFAULT"
fi

# Create the excludes file if not already present
touch "$EXCLUDES_FILE_PATH"

# Set up the config
git config --global user.name          "$FULL_NAME"
git config --global user.email         "$EMAIL"
git config --global user.signingkey    "$GPG_KEY_ID"
git config --global core.excludesFile  "$EXCLUDES_FILE_PATH"
git config --global init.defaultBranch "main"
git config --global commit.gpgSign     "true"
git config --global tag.gpgSign        "true"
git config --global push.gpgSign       "if-asked"
git config --global diff.renames       "copies"

# Done
echo "Done."
