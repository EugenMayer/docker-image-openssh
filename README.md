# WAT

And simple docker image to run a openssh server you can connect to. You can mount the keys as a volume to `/root/.ssh/keys`.
This is similar to https://github.com/EugenMayer/docker-image-ldapexample this should be used for creating DevOp e2e tests
or example setups.

This image is by no means created for production use.

## Usage

Your `docker-compose.yml` should like like this

```yaml
openssh:
  image: eugenmayer/openssh
  hostname: alpine
  ports:
    - '2222:22'
  volumes:
    - ./test/ssh-keys:/root/.ssh/keys
  restart: always
```

While `./ssh-keys/` looks like

```bash
id_rsa
id_rsa.pub
```

You can later use the id_rsa key to connect to the container using

```bash
ssh -i ./test/ssh-keys/id_rsa -p 2222 root@localhost
```

Be sure that id_rsa is only user-accessible as usually.

## Troubleshooting

See the logs under `/var/log/messages` on the container to understand, why the connection failed

## Build

```
make build
```
