# Development

## Notes

Send a message with shell `printf`.

```shell
msg='{"text":"hello"}'
len=${#msg}
printf "\\x$(printf '%02x' $((len&0xff)))\\x$(printf '%02x' $(((len>>8)&0xff)))\\x$(printf '%02x' $(((len>>16)&0xff)))\\x$(printf '%02x' $(((len>>24)&0xff)))%s" "$msg" | \
    /home/shane/homebrew/Cellar/hls/0.0.9/libexec/client
```

Send a message with `python`.

```shell
python3 -c "import sys, struct; sys.stdout.buffer.write(struct.pack('I', len('{}')) + '{}'.encode())" | \
    /home/shane/homebrew/Cellar/hls/0.0.9/libexec/client
```

Or with a message using `json.dumps`.

```shell
python3 -c "import sys, struct, json; msg = json.dumps({'key': 'value'}); sys.stdout.buffer.write(struct.pack('I', len(msg)) + msg.encode())" | \
    /home/shane/homebrew/Cellar/hls/0.0.9/libexec/client
```
