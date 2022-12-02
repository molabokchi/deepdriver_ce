# Deepdriver CE Standalone

This deepdriver CE Standalone is running standalone without Bokchi infrastructure.
If you using this experiment in personal computer or small group, this mode is the best way.

## Install

Clone git repository
```
$ git clone https://github.com/molabokchi/deepdriver_ce.git

Cloning into 'deepdriver_ce'...
remote: Enumerating objects: 186, done.
remote: Counting objects: 100% (186/186), done.
remote: Compressing objects: 100% (129/129), done.
remote: Total 186 (delta 100), reused 123 (delta 46), pack-reused 0
Receiving objects: 100% (186/186), 23.89 KiB | 5.97 MiB/s, done.
Resolving deltas: 100% (100/100), done.

```

## Run script

Move bokchiInfra directory (standalone)
```
$ cd deepdriver_ce/standalone

```

Start all containers
**Caution**: It takes few minutes for installing. Esepcially in the gitlab provisioning.

```
$ ./1.start.all.sh
🧿 Running Bokchi package

❇ 1. check environment
make ./_logs
make ./storage/.ssh
make ./storage/fs

❇ 2. up containers
Creating network "standalone_default" with the default driver
Pulling infra.rdb (registry.bokchi.com/infra_rdb:0.0.1-community)...
0.0.1-community: Pulling from infra_rdb
a603fa5e3b41: Pull complete
02d7a77348fd: Pull complete
16b62ca80c8f: Pull complete
fbd795da1fe1: Pull complete

... (skip) ...


Status: Downloaded newer image for registry.bokchi.com/publisher_board:0.1.0-community
Creating infra_rdb    ... done
Creating infra_nosql  ... done
Creating infra_gitlab ... done
Creating infra_mgr    ... done
Creating micro_experiment ... done
Creating micro_resource   ... done
Creating micro_user       ... done
Creating publisher_board  ... done
Creating micro_api        ... done

❇ 3. provisioning
 Sequence: [▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉] X Done! 50: created service useritlab

❇ 4. docker container status
      Name                    Command                  State                                Ports
--------------------------------------------------------------------------------------------------------------------------
infra_gitlab       /assets/wrapper                  Up (healthy)   0.0.0.0:6125->22/tcp,:::6125->22/tcp, 443/tcp,
                                                                   0.0.0.0:8883->80/tcp,:::8883->80/tcp
infra_mgr          /bin/bash /home/scripts/wa ...   Up
infra_nosql        docker-entrypoint.sh mongod      Up             0.0.0.0:37017->27017/tcp,:::37017->27017/tcp
infra_rdb          docker-entrypoint.sh postgres    Up             0.0.0.0:15432->5432/tcp,:::15432->5432/tcp
micro_api          fixuid /bin/sh -c java $JA ...   Up             0.0.0.0:9011->9011/tcp,:::9011->9011/tcp
micro_experiment   fixuid /bin/sh -c java $JA ...   Up             0.0.0.0:9031->9031/tcp,:::9031->9031/tcp
micro_resource     fixuid /bin/sh -c java $JA ...   Up             0.0.0.0:19051->19051/tcp,:::19051->19051/tcp,
                                                                   0.0.0.0:9051->9051/tcp,:::9051->9051/tcp
micro_user         fixuid /bin/sh -c java $JA ...   Up             0.0.0.0:9021->9021/tcp,:::9021->9021/tcp
publisher_board    /docker-entrypoint.sh ngin ...   Up             80/tcp, 0.0.0.0:9111->9111/tcp,:::9111->9111/tcp

❇ 5. completed successfully

 This packaging is used for bokchi deepdriver.
 If there is some question or bug report,
 feel free and contact us, support@bokchi.com
 Enjoy it!


```

Check your API key used in python.
run api-get script & remember this keys('apikey')
```
$ ./2.get.user.apikey.sh

Get user api information
{"rspResult":{"result":"success","message":"success to create user!"},"userId":1,"apiKey":"MzUxNDYyNjVmN2ExOTY5NDFjNjI3OGYyMWU0ZmJjMDVmM2RhOTgwOGEwNzJlNTg0YWZmZQ=="}
successfully done

```


## Develop in Colab (or your pyhton environment)

Go to colab example with the belew link

 Link: [Deepdriver Example in Colab](https://colab.research.google.com/github/molabokchi/bokchi_open_lab/blob/main/deepdriver_ce.ipynb)

![colab picture](https://github.com/molabokchi/deepdriver_ce/blob/3b6e9346f1b1bab8ddc07ebe839b8d1c6b28e306/etc/pic/colab_example2.png)



Input your server ip address
  
```
deepdriver.setting(http_host="{ip}:9011" ,grpc_host="{ip}:19051")
# eg. deepdriver.setting(http_host="localhost:9011" ,grpc_host="localhost:19051")

```
![colab ip address](https://github.com/molabokchi/deepdriver_ce/blob/3b6e9346f1b1bab8ddc07ebe839b8d1c6b28e306/etc/pic/colab_ip.png)



Input your api key.
eg) "MzUxNDYyNjVmN2ExOTY5NDFjNjI3OGYyMWU0ZmJjMDVmM2RhOTgwOGEwNzJlNTg0YWZmZQ=="

```
## replace "{USER_API_KEY}" to "your api key"
deepdriver.login(key="{USER_API_KEY}")

```
![colab api key](/colab_apikey.png)


Click menu > run time -> execute all (ctrl + f9)


Chick link to analysis your results after finish experiment.
![colab link](https://github.com/molabokchi/deepdriver_ce/blob/3b6e9346f1b1bab8ddc07ebe839b8d1c6b28e306/etc/pic/finished_link.png)



## Check your experiments
Check your data & analyse data with charts
 ![exp_chart pic](https://github.com/molabokchi/deepdriver_ce/blob/3b6e9346f1b1bab8ddc07ebe839b8d1c6b28e306/etc/pic/exper_charts1.png)


Anaylse run data with table panel
 ![exp_table pic](https://github.com/molabokchi/deepdriver_ce/blob/3b6e9346f1b1bab8ddc07ebe839b8d1c6b28e306/etc/pic/exper_table.png)

## Check your runs
Analyse summary data as table
 ![run_chart pic](https://github.com/molabokchi/deepdriver_ce/blob/3b6e9346f1b1bab8ddc07ebe839b8d1c6b28e306/etc/pic/run_charts1.png)


## Check your artifacts
Tracking data with versioning artifacts
 ![artifact pic](arti_overview.png)


## Uninstall
run clear script
```
$ ./0.clear.all.sh

[CAUTION] All service will be initialized
 Are you sure? [y/N]y

❇ 1. down all container
Stopping micro_message    ... done
Stopping publisher_board  ... done
Stopping micro_user       ... done
Stopping micro_api        ... done
Stopping micro_experiment ... done
Stopping micro_resource   ... done
Removing micro_message    ... done
Removing publisher_board  ... done
Removing micro_user       ... done
Removing micro_api        ... done
Removing micro_experiment ... done
Removing micro_resource   ... done
Removing network bokchiinfra_default

❇ 2. delete all docker images
Untagged: registry.bokchi.com/micro_api:0.0.2-community-snapshot
Untagged: registry.bokchi.com/micro_api@sha256:b50716e3f654745391a0775944a9405d715e3dc6776e167a538a10d1f975eba8
Deleted: sha256:6bc1fccba742c28dcac01d2aba0bbd52506b2be8bccb084da3ffaa61e1de91cc
Deleted: sha256:72d88658557cee571d3fde15de659394dc36b256d69f3c113a7a7be745ed4288
Deleted: sha256:b97f92f787012294ceeb878a51044de7b6302b65099c79010f5d0db0579070c5
Deleted: sha256:2a51370e68394ba57b2e3fabce06d40e2290e68e1da4394b48fa0545b9fa9770
Deleted: sha256:722bf4b087b376f266f35fd204aa45cd517d0de1e6616f95b97581ca87b2edbf
Deleted: sha256:e6650cb42a471552da5a661ecff8497437edcba6737c747a38653a49c4fc7bfa

... (skip) ...

Deleted: sha256:f0b70723d9e1e6b9fb1e9aeb587e10defd08a45342c8247ae43aceebf8084f2a
Deleted: sha256:5bdeef4a08f393fcbfa9e33e9abd8912a34d8f83dbae73e97564ca77fb01999b

❇ 3. delete used directories

uninstalled successfully

 This packaging is used for bokchi deepdriver.
 If there is some question or bug report,
 feel free and contact us, support@bokchi.com
 Thanks!

```

## More

- Visit [bokchi web](https://bokchi.com) more information.
- Contact <support@bokchi.com>



