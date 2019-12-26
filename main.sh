#!/bin/bash

WELCOME="!!welcome to discord-websh, a useless webhook application"
VERSION="!!V0.0.1"

enabled() {
echo $WELCOME;
echo $VERSION;
}

enabled

text=${1}
url=${2}

[[ -z ${1} ]] && echo provide text && read text;
[[ -z ${2} ]] && echo provide a valid webhook URL && read url;

send() {
msg_content=" { \"content\": \"$text\" }";

curl -X POST -H 'Content-Type: application/json' -d "$msg_content" "$url"

error=$?
[[ "${error}" -ne 0 ]] && echo "error: didn't send '${text}' successfully [${error}]" && exit $error;
}

send
echo "sent '${text}' successfully" && exit 1;