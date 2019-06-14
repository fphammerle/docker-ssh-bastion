# Docker: OpenSSH-Server Restricted to TCP Forwarding 🐳

Docker Hub: https://hub.docker.com/r/fphammerle/ssh-bastion

## Example: Share Web Server

```sh
bastion $ docker run --name ssh-bastion -p 2222:22 -e USERS=alice,bob fphammerle/ssh-bastion
bastion $ docker cp alice-keys ssh-bastion:/home/alice/.ssh/authorized_keys
bastion $ docker cp bob-keys ssh-bastion:/home/bob/.ssh/authorized_keys
alice $ ssh -N -R 28080:localhost:8080 -p 2222 bastion
bob $ ssh -N -L 8081:localhost:28080 -p 2222 bastion
bob $ curl http://localhost:8081/hello_bob.html
```

## Example: SSH Jump Host

```
$ docker run --name ssh-bastion \
    --publish 2222:22 --env USERS=alice,bob \
    --volume bastion-host-keys:/etc/ssh/host_keys \
    --volume alice-ssh-config:/home/alice/.ssh:ro \
    --volume bob-ssh-config:/home/bob/.ssh:ro \
    --init --rm \
    fphammerle/ssh-bastion
$ ssh -N -R 22221:localhost:22 -p 2222 alice@bastion
$ ssh -J bob@bastion:2222 -p 22221 localhost
```

### Docker Compose 🐙

1. `git clone https://github.com/fphammerle/docker-ssh-bastion`
2. Adapt `$USERS` and volumes in [docker-compose.yml](docker-compose.yml)
3. `docker-compose up`
