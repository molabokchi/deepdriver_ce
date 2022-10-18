# deepdriver_ce (community edition)
ML platform deepdriver @bokchi.com

this platform is limited for community or academi

# quick start

1. Install docker-compose @Ubuntu,Debian
```bash 
$ sudo apt-get update
$ sudo apt-get install docker-compose-plugin

```
* @RPM-based distros:
```bash
$ sudo yum update
$ sudo yum install docker-compose-plugin

```
you can reference from https://docs.docker.com/compose/install/

2. Apply executable permissions to the binary
```bash
$ sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
```

3. Git clone this repository & run 
```bash
$ git clone https://github.com/molabokchi/deepdriver_ce.git

$ cd deepdriver_ce

$ 1.run.sh
[ec2-user@ip-10-0-0-113 deepdriver_ce]$ ./1.run.sh
Pulling service.apimicro (registry.bokchi.com/micro_api:0.0.1-community)...
0.0.1-community: Pulling from micro_api
d836772a1c1f: Pull complete
66a9e63c657a: Pull complete
d1989b6e74cf: Pull complete
c28818711e1e: Pull complete
0dec79474efa: Pull complete
d4acb92eeea1: Pull complete
3121d762f524: Pull complete
3489fdcfc8f0: Pull complete
133eb83773d0: Pull complete
c7aefda22d52: Pull complete
Digest: sha256:4e76731bb5742e5d0b6f9ca062a2093c09ec0aa0f7e8c38e9b65b5f98bb76f50
Status: Downloaded newer image for registry.bokchi.com/micro_api:0.0.1-community
Pulling service.usermicro (registry.bokchi.com/micro_user:0.0.1-community)...
0.0.1-community: Pulling from micro_user
... (skip) ... 
Creating micro_experiment ... done
Creating micro_user       ... done
Creating publisher_board  ... done
Creating micro_message    ... done
Creating micro_api        ... done
Creating micro_resource   ... done
[ec2-user@ip-10-0-0-113 deepdriver_ce]$ docker ps -a
CONTAINER ID   IMAGE                                                  COMMAND                  CREATED          STATUS          PORTS                                               NAMES
ededdfa57feb   registry.bokchi.com/micro_resource:0.0.1-community     "/bin/sh -c 'java $J…"   29 seconds ago   Up 23 seconds   0.0.0.0:9051->9051/tcp, :::9051->9051/tcp           micro_resource
4307256cbd2c   registry.bokchi.com/micro_api:0.0.1-community          "/bin/sh -c 'java $J…"   29 seconds ago   Up 23 seconds   0.0.0.0:9011->9011/tcp, :::9011->9011/tcp           micro_api
efd2ed40f068   registry.bokchi.com/micro_message:0.0.1-community      "/bin/sh -c 'java $J…"   29 seconds ago   Up 23 seconds   0.0.0.0:9041->9041/tcp, :::9041->9041/tcp           micro_message
267516e6ea54   registry.bokchi.com/micro_user:0.0.1-community         "/bin/sh -c 'java $J…"   29 seconds ago   Up 23 seconds   0.0.0.0:9021->9021/tcp, :::9021->9021/tcp           micro_user
e8da6561c1c6   registry.bokchi.com/publisher_board:0.0.1-community    "/docker-entrypoint.…"   29 seconds ago   Up 23 seconds   80/tcp, 0.0.0.0:9111->9111/tcp, :::9111->9111/tcp   publisher_board
fc1393c016dc   registry.bokchi.com/micro_experiment:0.0.1-community   "/bin/sh -c 'java $J…"   29 seconds ago   Up 23 seconds   0.0.0.0:9031->9031/tcp, :::9031->9031/tcp           micro_experiment
[ec2-user@ip-10-0-0-113 deepdriver]$

```

4. connection with browser with localhost:9111



