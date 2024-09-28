#!/bin/bash

if [ -z "$1" ]; then
  echo "ERROR: missing pcap file parameter"
  echo "usage: $0 <pcap file>"
  exit 255
fi

/Applications/Wireshark.app/Contents/MacOS/tshark -r $1 -Tfields -e tcp.payload -d tcp.port==4700,json -Yjson| xxd -r -p | jq -C -R "fromjson? | . "
