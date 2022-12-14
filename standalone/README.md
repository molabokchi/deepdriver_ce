# Deepdriver CE Standalone

This Deepdriver CE Standalone is running standalone without any infrastructure.
If you run ML experiment using personal computer in small group, this mode is one onf the the best way.

## Requirement

docker & docker-compose
> If it's not installed, refer to [docker website](https://docs.docker.com/engine/install/#server) and install it.

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



## Run script (standalone)

Move to standalone directory
```
$ cd deepdriver_ce/standalone

```

Start all containers
**Caution**: It takes few minutes for installing. Esepcially in the gitlab provisioning step.

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
-----------------------------------------------------------------------------------------------------------------
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



Run apikey-script to get keys text('apikey') and remember your API key used in python.

```
$ ./2.get.user.apikey.sh

Get user api information
{"rspResult":{"result":"success","message":"success to create user!"},"userId":1,"apiKey":"MzUxNDYyNjVmN2ExOTY5NDFjNjI3OGYyMWU0ZmJjMDVmM2RhOTgwOGEwNzJlNTg0YWZmZQ=="}
successfully done

```

## Other scripts
There are many scripts for help your maintance. check the below scripts
- 0.clear.all.sh: stop all containers, clear storage and container images. return to the status not installed deepdriver.
- 0.stop.[all|service|publisher]: stop micro-service. not delete container image and mounted storages.
- 0.update.[all|service|publisher]: stop micro-service. delete only container image. restart as docker-compose.yaml
- 1.start.[all|service|publisher]: start(install) all service. it make mandatory directories(_data, storages, logs...). start container as docker-compose.yaml
- utils/update.micro_[api|user|experiment|message|resource|publisher]: stop specific micro-service. delete only container image. restart as docker-compose.yaml


## Develop code in python environment

We use Google Colab now, but it is NOT mandatory requirement. You can use Deepdriver anywhare installed python.

If you know how to use python module, visit [Gtbook reference document](https://bokchi.gitbook.io/deepdriver-ce/).

Go to colab example with the belew link

 Link: [Deepdriver Example in Colab](https://colab.research.google.com/github/molabokchi/bokchi_open_lab/blob/main/deepdriver_ce.ipynb)

![colab picture](https://github.com/molabokchi/deepdriver_ce/blob/3b6e9346f1b1bab8ddc07ebe839b8d1c6b28e306/etc/pic/colab_example2.png)



Input your server ip address to the below code `{ip}`. You don't need to change ports.

```
deepdriver.setting(http_host="{ip}:9011" ,grpc_host="{ip}:19051")
# eg. deepdriver.setting(http_host="localhost:9011" ,grpc_host="localhost:19051")

```
![colab ip address](https://github.com/molabokchi/deepdriver_ce/blob/3b6e9346f1b1bab8ddc07ebe839b8d1c6b28e306/etc/pic/colab_ip.png)



Input your api key to the below code `{USER_API_KEY}`
eg) "MzUxNDYyNjVmN2ExOTY5NDFjNjI3OGYyMWU0ZmJjMDVmM2RhOTgwOGEwNzJlNTg0YWZmZQ=="

```
## replace "{USER_API_KEY}" to "your api key"
deepdriver.login(key="{USER_API_KEY}")

```
![colab api key](https://github.com/molabokchi/deepdriver_ce/blob/21fcbd227091de6f8cc5904d95bffaea5b3c6b66/etc/pic/colab_apikey.png)



Click menu > run time -> execute all (Ctrl + F9)
Chick link to analyze your results after finished experiment.
![colab link](https://github.com/molabokchi/deepdriver_ce/blob/3b6e9346f1b1bab8ddc07ebe839b8d1c6b28e306/etc/pic/finished_link.png)



## View your experiments
Input your `server ip address` to the dialog.
 ![dashboard_ipaddress](https://github.com/molabokchi/deepdriver_ce/blob/21fcbd227091de6f8cc5904d95bffaea5b3c6b66/etc/pic/dash_ipaddr.png)

Check and analyze your experiment information(hyper-parameters, results) in many kind of charts. You can create line plot, bar chart, scatter plot, scala chart and parallel coordinates in your panel.

 ![exp_chart pic](https://github.com/molabokchi/deepdriver_ce/blob/3b6e9346f1b1bab8ddc07ebe839b8d1c6b28e306/etc/pic/exper_charts1.png)

Also, you can analyze data in table format.
![exp_table pic](https://github.com/molabokchi/deepdriver_ce/blob/3b6e9346f1b1bab8ddc07ebe839b8d1c6b28e306/etc/pic/exper_table.png)



## View your run details
Inspect one run data in more detail.

![run_chart pic](https://github.com/molabokchi/deepdriver_ce/blob/3b6e9346f1b1bab8ddc07ebe839b8d1c6b28e306/etc/pic/run_charts1.png)



## Check your artifacts

Tracking data with versioning artifacts. Artifacts can be roll-back anytime, anywhere. 
 ![artifact pic1](https://github.com/molabokchi/deepdriver_ce/blob/dfec4fd702048cc2d0006b00c1f4ad5c1efa2b59/etc/pic/dash_artifact_1.png)

Finding your files and folder in dashboard.
 ![artifact_pic2](https://github.com/molabokchi/deepdriver_ce/blob/dfec4fd702048cc2d0006b00c1f4ad5c1efa2b59/etc/pic/dash_artifact_2.png)


## Uninstall

run clear script.
```
./0.clear.all.sh

[CAUTION] All data(database, log, images) will be deleted.
 Are you sure? [y/N]y

❇ 1. down all container
Stopping micro_api        ... done
Stopping publisher_board  ... done
Stopping micro_user       ... done
Stopping micro_resource   ... done
Stopping micro_experiment ... done
Stopping infra_mgr        ... done
Stopping infra_gitlab     ... done
Stopping infra_nosql      ... done
Stopping infra_rdb        ... done
Removing micro_api        ... done
Removing publisher_board  ... done
Removing micro_user       ... done
Removing micro_resource   ... done
Removing micro_experiment ... done
Removing infra_mgr        ... done
Removing infra_gitlab     ... done
Removing infra_nosql      ... done
Removing infra_rdb        ... done
Removing network standalone_default

❇ 2. delete all docker images
Untagged: registry.bokchi.com/publisher_board:0.1.0-community
Untagged: registry.bokchi.com/publisher_board@sha256:1ec86e3c49961326cd439bf440d5b053b207613d370f656a8b94eb4e408c7315
Deleted: sha256:f00b6bbd9ca1c0167bf15e1b96a23c6a9800431e5699086e0eee15e0c4171d53

... (skip) ...

Deleted: sha256:abebed1e4e8c594d0dfc1dee466e232942379f9521ff72bf2ecc10abf13bcf5b
Deleted: sha256:ec4a38999118b78eab6899b913a548cb0b2c9b68fd05aff846a56b628b597f38

❇ 3. delete used directories

uninstalled successfully

 This packaging is used for bokchi deepdriver.
 If there is some question or bug report,
 feel free and contact us, support@bokchi.com
 Thanks!

```



## More

- Visit [bokchi web](https://bokchi.com) to more information.
- Contact <support@bokchi.com>



