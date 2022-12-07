# Deepdriver CE (Community Edition)
Deepdriver는 [Bokchi Lab. 머신러닝 서비스](https://bokchi.com) 중의 하나입니다. Deepdriver는 웹서비스 실험환경 서비스입니다. Bokchi Lab.은 쉬운 개발환경, 시각화된 기능, 제한이 없는 자원사용(CPU/GPU)를 제공하고 합리적인 비용으로 서비스 합니다. 

또한 Deepdriver CE(Community edition)을 커뮤니티 활성화를 위하여 배포하고있습니다. 시각화된 차트, 사용이 편한 테이블, 사용 관게 추적, Large file 버저닝 기능으로 dataset, code, model을 추적하고 필요할 때 사용할 수 있습니다. 이 모든 것이 무료로 제공됩니다.

Bokchi Lab.은 Deepdriver CE를 통하여 머신러닝 커뮤니티의 성장에 기여하길 바랍니다.   



## 요구사항

도커와 파이선 개발 환경만 준비되면 됩니다. 컨테이너의 프로비저잉을 위하여 Docker-compose를 사용합니다. 

### 1. Docker가 설치되어 있는지 확인합니다. 


설치 확인
```bash
$ docker --version
Docker version 20.10.13, build a224086

```

docker가 설치되어 있지 않다면, docker websit에서 내용을 확인하고 설치합니다. 

[모든 플랫폼별 docker 설치하는 방법](https://docs.docker.com/engine/install/#server)

> 만약에 도커를 사용할 때마다 'sudo'를 매번 사용해야 한다면, 아래의 코드로 사용자를 docker 그룹에 넣으세요. 
>
> ```bash
> $ sudo usermode -aG docker $USER
> ```

### 2. docker-compose가 설치되어 있는지 확인합니다. 

설치 확인
```bash
$ docker-compose version
docker-compose version 1.29.1, build c34c88b2
docker-py version: 5.0.0
CPython version: 3.7.10
OpenSSL version: OpenSSL 1.1.0l  10 Sep 2019

```

Docker-compose 설치 합니다. 

Ubuntu,Debian의 경우

```bash 
$ sudo apt-get install docker-compose-plugin

```

CentOS의 경우

```bash
$ sudo yum install docker-compose-plugin

```

docker-compose의 설치는 [공식 사이트](https://docs.docker.com/compose/install/)에서도 확인할 수 있습니다. 

> 권한 문제로 실행에 문제가 발생하면 docker-compose에 실행 권한을 부여합니다. 
>
> ```
> $ sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
> ```
>
> 



## 모드

Deepdriver는 데이터베이스와 파일 시스템을 저장공간으로 사용합니다. 저장공간을 어떻게 사용하느냐에따라서 두가지 모드로 나눌 수 있습니다. 첫번째는 Bokchi Lab.에서 제공하는 공개 인프라를 사용하는 방법이고 다른하나는 개인적인 공간을 사용하는 방법입니다. 

- **Bokchi Infra mode**: Bokchi Lab.에서 제공하는 인프라를 사용하는 모드. [bokchiInfra](./bokchiInfra)에서 확인
- **Standalone mode**: 개인적인 공간을 사용하는 모드 [standalone](./standalone)에서 확인





## 빠른 체험

### 1. 파이선 개발 환경

파이선 환경에서 코드를 개발할 수 있습니다. 지금은 Google Colab을 사용하여 체험하게 될 것입니다. 하지만 이것은 필수 환경이 아닙니다. python이 설치되어 있는 어느 곳에서든지 사용할 수 있습니다. 

파이선 모듈 사용방법은 [Gtbook reference document](https://bokchi.gitbook.io/deepdriver-ce/)에 설명되어 있습니다. 

체험을 위해서 아래 링크를 클릭하고 모두 실행하세요. 

링크: [Deepdriver Example in Colab](https://colab.research.google.com/github/molabokchi/bokchi_open_lab/blob/main/deepdriver.ipynb)



### 2. Deepdriver 데시보드 

만들어진 실험 정보(하이퍼파리미터, 정확도 결과)를 확인하고 분석할 수 있습니다. 그리고 line plot, bar chart, scatter chart, scala chart, parallel coordinates 그래프를 패널에 추가할 수 있습니다. 

참고: 초기 데시보드 진입시에 ip address를 물어보면 `quick-experience.bokchi.com`으로 입력한다.

![exp_chart pic](https://github.com/molabokchi/deepdriver_ce/blob/3b6e9346f1b1bab8ddc07ebe839b8d1c6b28e306/etc/pic/exper_charts1.png)

또한, 테이블의 형태로 중요 데이터의 선택과 정렬을 통하여 분석이 가능합니다.
![exp_table pic](https://github.com/molabokchi/deepdriver_ce/blob/3b6e9346f1b1bab8ddc07ebe839b8d1c6b28e306/etc/pic/exper_table.png)

하나의 실행을 보다 자세한 화면을 통하여 분석이 가능합니다. 

![run_chart pic](https://github.com/molabokchi/deepdriver_ce/blob/3b6e9346f1b1bab8ddc07ebe839b8d1c6b28e306/etc/pic/run_charts1.png)

버저닝된 Artifact를 사용하여 추적이 가능하며, 언제 어디서든지 이전 데이터를 불러와서 사용할 수 있습니다. 
 ![artifact pic](arti_overview.png)



## 문제 해결

### 1. Docker 미설치

```
Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?
```

해결방법: docker를 설치하거나 실행하세요.



## 더 많은 정보

- 더 많은 정보를 원하시면 [bokchi web](https://bokchi.com)를 방문하세요.
- 문의사항은 <support@bokchi.com>로 메일을 보내주세요. 



