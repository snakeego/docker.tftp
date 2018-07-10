# tftp

To build

```
docker build --rm -t tftp .
```

To run

```
docker run -p 0.0.0.0:69:69/udp -i -t tftp
```

Mounts the following volume for persistent data

```
/var/tftpboot
```

To map the volume to a host directory

```
docker run -p 0.0.0.0:69:69/udp -v $(pwd)/tftp:/tftp -i -t tftp
```
