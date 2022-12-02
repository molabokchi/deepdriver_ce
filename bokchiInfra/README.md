# Deepdriver CE with Infrabokchi Infra

This deepdriver CE use Infra bokchi infrastructure. You can use Deepdriver more lightly than standalone version. 

## Install

Clone git repository
```
git clone https://github.com/molabokchi/deepdriver_ce.git
Cloning into 'deepdriver_ce'...
remote: Enumerating objects: 186, done.
remote: Counting objects: 100% (186/186), done.
remote: Compressing objects: 100% (129/129), done.
remote: Total 186 (delta 100), reused 123 (delta 46), pack-reused 0
Receiving objects: 100% (186/186), 23.89 KiB | 5.97 MiB/s, done.
Resolving deltas: 100% (100/100), done.

```

## Run script

Move bokchiInfra directory
```
$ cd deepdriver_ce/bokchiInfra/
```

Start all containers
```
$ 1.start.all.sh
❇ 1. check environment
make ./_logs
make ./storage/.ssh
make ./storage/fs

❇ 2. run container @docker-composer by the current user
Creating network "bokchiinfra_default" with the default driver
Pulling service.apimicro (registry.bokchi.com/micro_api:0.0.2-community-snapshot)...
0.0.2-community-snapshot: Pulling from micro_api
d836772a1c1f: Pull complete
66a9e63c657a: Pull complete
d1989b6e74cf: Pull complete
c28818711e1e: Pull complete

...(skip)...

5b6ea229adc1: Pull complete
f886153f43c6: Pull complete
3682d3e40095: Pull complete
Digest: sha256:e3ec88030e22a56bfc6f16eb91c202f31a71713dc45486454e3211cc54b05e32
Status: Downloaded newer image for registry.bokchi.com/publisher_board:0.0.2-community-snapshot
Creating micro_user       ... done
Creating publisher_board  ... done
Creating micro_message    ... done
Creating micro_resource   ... done
Creating micro_experiment ... done
Creating micro_api        ... done

❇ 3. container status
      Name                    Command               State                                     Ports
-------------------------------------------------------------------------------------------------------------------------------------
micro_api          fixuid /bin/sh -c java $JA ...   Up      0.0.0.0:9011->9011/tcp,:::9011->9011/tcp
micro_experiment   fixuid /bin/sh -c java $JA ...   Up      0.0.0.0:9031->9031/tcp,:::9031->9031/tcp
micro_message      fixuid /bin/sh -c java $JA ...   Up      0.0.0.0:9041->9041/tcp,:::9041->9041/tcp
micro_resource     fixuid /bin/sh -c java $JA ...   Up      0.0.0.0:19051->19051/tcp,:::19051->19051/tcp,
                                                            0.0.0.0:9051->9051/tcp,:::9051->9051/tcp
micro_user         fixuid /bin/sh -c java $JA ...   Up      0.0.0.0:9021->9021/tcp,:::9021->9021/tcp
publisher_board    /docker-entrypoint.sh ngin ...   Up      80/tcp, 0.0.0.0:9111->9111/tcp,:::9111->9111/tcp


❇ 4. completed successfully

 This packaging is used for bokchi deepdriver.
 If there is some question or bug report,
 feel free and contact us, support@bokchi.com
 Enjoy it!

```

## Develop @python





## Uninstall
run clear script
```
./0.clear.all.sh

[CAUTION] All service will be initialized
 Are you sure? [y/N]y

down all container
Stopping micro_api        ... done
Stopping micro_experiment ... done
Stopping micro_message    ... done
Stopping publisher_board  ... done
Stopping micro_resource   ... done
Stopping micro_user       ... done
Removing micro_api        ... done
Removing micro_experiment ... done
Removing micro_message    ... done
Removing publisher_board  ... done
Removing micro_resource   ... done
Removing micro_user       ... done
Removing network bokchiinfra_default

delete all docker images
Untagged: registry.bokchi.com/micro_experiment:0.0.2-community-snapshot
Untagged: registry.bokchi.com/micro_experiment@sha256:bda48e81072e25cf00612834f30ea0c79176b4ed610b13399db1d64311b3d77c
Deleted: sha256:35add268126746b1deebdac393cd8f8b1cab3720f063fd37b288d0ac9ba5e400
Deleted: sha256:492f79a1801093c3db251da52166245b683a2628322c3faad30f9097fd195278
Deleted: sha256:2940ae1916e5c093bfbe529e1ab75760d541407de91569314f6143391b040926
Deleted: sha256:b6791517b02e5d0ab2453d2b5dd19a236895bc137bb01c05c24d66b18f8459e0

... (skip) ...

Deleted: sha256:4fd995c0883713c5ae7796e73d75c038c47b88dccd5567c389756991054e64cf
Deleted: sha256:f0b70723d9e1e6b9fb1e9aeb587e10defd08a45342c8247ae43aceebf8084f2a
Deleted: sha256:5bdeef4a08f393fcbfa9e33e9abd8912a34d8f83dbae73e97564ca77fb01999b

delete all directories


```

