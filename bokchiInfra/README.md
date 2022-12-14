# Deepdriver CE with Bokchi Infra

This deepdriver CE (bokchi infra) use Infra bokchi infrastructure. You can use Deepdriver more lightly than standalone version. 

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



## Run script

Move to bokchiInfra directory
```
$ cd deepdriver_ce/bokchiInfra/

```

Start all containers
```
$ ./1.start.all.sh
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
-----------------------------------------------------------------------------------------------------------------
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

## Other scripts
There are many scripts for help your maintance. check the below scripts
- 0.clear.all.sh: stop all containers, clear storage and container images. return to the status not installed deepdriver.
- 0.stop.[all|service|publisher]: stop micro-service. not delete container image and mounted storages.
- 0.update.[all|service|publisher]: stop micro-service. delete only container image. restart as docker-compose.yaml
- 1.start.[all|service|publisher]: start(install) all service. it make mandatory directories(_data, storages, logs...). start container as docker-compose.yaml
- utils/update.micro_[api|user|experiment|message|resource|publisher]: stop specific micro-service. delete only container image. restart as docker-compose.yaml




## Develop code in pyhton environment

We use Google Colab, but it is NOT mandatory requirement. You can use deepdriver anywhare installed python.

If you know how to use python module, visit [Gtbook reference document](https://bokchi.gitbook.io/deepdriver-ce/).

Go to colab example with the belew link

 Link: [Deepdriver Example in Colab](https://colab.research.google.com/github/molabokchi/bokchi_open_lab/blob/main/deepdriver_ce.ipynb)

![colab picture](https://github.com/molabokchi/deepdriver_ce/blob/3b6e9346f1b1bab8ddc07ebe839b8d1c6b28e306/etc/pic/colab_example2.png)



Input your server ip address @colab (deepdriver.ipynb) 

```
deepdriver.setting(http_host="{ip}:9011" ,grpc_host="{ip}:19051")
# eg. deepdriver.setting(http_host="localhost:9011" ,grpc_host="localhost:19051")


```
![colab ip address](https://github.com/molabokchi/deepdriver_ce/blob/3b6e9346f1b1bab8ddc07ebe839b8d1c6b28e306/etc/pic/colab_ip.png)



Click menu > run time -> execute all (Ctrl + F9)

Chick link to analyze your results after finished experiment.
![colab link](https://github.com/molabokchi/deepdriver_ce/blob/3b6e9346f1b1bab8ddc07ebe839b8d1c6b28e306/etc/pic/finished_link.png)



## View your experiments

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



