#!/bin/bash

WELCOME="!!welcome to discord-websh, a useless webhook application"
VERSION="!!V0.0.2"

enabled() {
echo $WELCOME;
echo $VERSION;
}

enabled

while read url; do
	echo "successfully found webhook url"
done < url.txt;

text=${1}

[[ -z ${1} ]] && echo provide text && read text;
[[ -z ${url} ]] && echo provide a valid webhook URL in url.txt && exit 1;

send() {
msg_content=" { \"content\": \"$text\" }";

curl -X POST -H 'Content-Type: application/json' -d "$msg_content" "$url"

error=$?
[[ "${error}" -ne 0 ]] && echo "error: didn't send '${text}' successfully [${error}]" && exit $error;
}

send
echo "sent '${text}' successfully" && exit 1;