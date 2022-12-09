# Deepdriver CE (Community Edition)
Deepdriver is a service of [Bokchi machine learing services](https://bokchi.com). It is ML experiment platform for web.
We serve easy usages development interface, visualized analysis views, unlimited GPU access & resonable cost.

We also publish Deepdriver CE(Community Edition) for community. You can use visualized charts, easy usagable tables, trackable lineage, versioning artifacts(LF) and other utiliations for free.
We hope it will contribute to the growth of the ML community.





## Requirements

All you need are docker and python environment. We use dock-compose for container provisioning.

### 1. Check if docker is installed

Check installed docker
```bash
$ docker --version
Docker version 20.10.13, build a224086

```

If docker is not installed in your environment, refer to docker website.

 [docker install guide for all platform](https://docs.docker.com/engine/install/#server)

> If you should use 'sudo' for using docker container, type the below code to insert docker group.
>
> ```bash
> $ sudo usermode -aG docker $USER
> ```

### 2. Check if docker-compose is installed

Check installed docker-compose
```bash
$ docker-compose version
docker-compose version 1.29.1, build c34c88b2
docker-py version: 5.0.0
CPython version: 3.7.10
OpenSSL version: OpenSSL 1.1.0l  10 Sep 2019

```

Install docker-compose. 

Case: Ubuntu,Debian

```bash 
$ sudo apt-get install docker-compose-plugin

```

Case: CentOS

```bash
$ sudo yum install docker-compose-plugin

```

You can also reference at [docker website for docker-compose](https://docs.docker.com/compose/install/).

> If there is permission problem, apply executable permissions to the binary
>
> ```
> $ sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
> ```
>
> 



## Mode

Deepdriver use database and filesystem as the storage. it is seperated to two mode depending on how you use it. One mode uses public infrastructure and the other mode uses independent storage in your PC.

- **Bokchi Infra mode**: use Bokchi public infrastructure. go to [bokchiInfra](./bokchiInfra).
- **Standalone mode**: use your personal computer. go to [standalone](./standalone).





## Quick experience

### 1. In python environment

Develop code in python environment. we use Google Colab now, but it is NOT mandatory requirement. You can use Deepdriver anywhare installed python.

If you know how to use python module, visit [Gtbook reference document](https://bokchi.gitbook.io/deepdriver-ce/).

Go to colab example with the belew link and execute all(Ctrl + F9).

 Link: [Deepdriver Example in Colab](https://colab.research.google.com/github/molabokchi/bokchi_open_lab/blob/main/deepdriver.ipynb)



### 2. In bokchi dashboard

Check and analyze your experiment information(hyper-parameters, results) in many kind of charts. You can create line plot, bar chart, scatter plot, scala chart and parallel coordinates in your panel.

If require ip address at dialog on front of dashboard, input `quick-experience.bokchi.com` as ip address. 

 ![exp_chart pic](https://github.com/molabokchi/deepdriver_ce/blob/3b6e9346f1b1bab8ddc07ebe839b8d1c6b28e306/etc/pic/exper_charts1.png)

Also, you can analyze data in table format.
![exp_table pic](https://github.com/molabokchi/deepdriver_ce/blob/3b6e9346f1b1bab8ddc07ebe839b8d1c6b28e306/etc/pic/exper_table.png)

Inspect one run data in more detail.

![run_chart pic](https://github.com/molabokchi/deepdriver_ce/blob/3b6e9346f1b1bab8ddc07ebe839b8d1c6b28e306/etc/pic/run_charts1.png)

Tracking data with versioning artifacts. Artifacts can be roll-back anytime, anywhere. 
 ![artifact pic1](https://github.com/molabokchi/deepdriver_ce/blob/dfec4fd702048cc2d0006b00c1f4ad5c1efa2b59/etc/pic/dash_artifact_1.png)

Finding your files and folder in dashboard.
 ![artifact_pic2](https://github.com/molabokchi/deepdriver_ce/blob/dfec4fd702048cc2d0006b00c1f4ad5c1efa2b59/etc/pic/dash_artifact_2.png)


## Trouble shooting

### 1. Not installed docker

```
Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?
```

Solve: install docker or run docker 



## More

- Visit [bokchi web](https://bokchi.com) to more information.
- Contact <support@bokchi.com>



