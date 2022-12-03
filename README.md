# Deepdriver CE (Community Edition)
Deepdriver is a service of [Bokchi machine learing services](https://bokchi.com). It is ML experiment platform for web.
We serve easy usages development interface, visualized analysis views, unlimited GPU access & resonable cost.

We also publish Deepdriver CE(Community Edition) for community. You can use visualized charts, easy usagable tables, trackable lineage, versioning artifacts(LF) and other utiliations for free.
We hope it will contribute to the growth of the ML community.





## Requriements

All you need are docker container and python environment.

We use dock-compose for container provisioning. Install docker-compose. 

Case: Ubuntu,Debian

```bash 
$ sudo apt-get update
$ sudo apt-get install docker-compose-plugin

```

Case: RPM-based distros:

```bash
$ sudo yum update
$ sudo yum install docker-compose-plugin

```

You can also reference at https://docs.docker.com/compose/install/.

Apply executable permissions to the binary

```bash
$ sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

```





## Mode

Deepdriver use database and filesystem as the storage. it is seperated to two mode depending on how you use it. One mode uses public infrastructure and the other mode uses independent storage in your PC.

- **Bokchi Infra mode**: use Bokchi public infrastructure. go to [bokchiInfra](./bokchiInfra).
- **Standalone mode**: use your personal computer. go to [standalone](./standalone).





## Quick experience

### 1. In python environment

Develop code in python environment. we use Google Colab now, but it is NOT mandatory requirement. You can use Deepdriver anywhare installed python.

Go to colab example with the belew link and execute all(Ctrl + F9).

 Link: [Deepdriver Example in Colab](https://colab.research.google.com/github/molabokchi/bokchi_open_lab/blob/main/deepdriver.ipynb)



### 2. In bokchi dashboard

Check and analyze your experiment information(hyper-parameters, results) in many kind of charts. You can create line plot, bar chart, scatter plot, scala chart and parallel coordinates in your panel.

 ![exp_chart pic](https://github.com/molabokchi/deepdriver_ce/blob/3b6e9346f1b1bab8ddc07ebe839b8d1c6b28e306/etc/pic/exper_charts1.png)

Also, you can analyze data in table format.
![exp_table pic](https://github.com/molabokchi/deepdriver_ce/blob/3b6e9346f1b1bab8ddc07ebe839b8d1c6b28e306/etc/pic/exper_table.png)

Inspect one run data in more detail.

![run_chart pic](https://github.com/molabokchi/deepdriver_ce/blob/3b6e9346f1b1bab8ddc07ebe839b8d1c6b28e306/etc/pic/run_charts1.png)

Tracking data with versioning artifacts. Artifacts can be roll-back anytime, anywhere. 
 ![artifact pic](arti_overview.png)





## More

- Visit [bokchi web](https://bokchi.com) to more information.
- Contact <support@bokchi.com>



