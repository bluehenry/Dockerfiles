FROM oraclelinux:7-slim

ARG release=19
ARG update=3

RUN yum -y update
RUN yum -y install which
RUN yum -y install vim
RUN yum -y install iputils
RUN yum -y install oracle-release-el7 && yum-config-manager --enable ol7_oracle_instantclient && \
    yum -y install oracle-instantclient${release}.${update}-basic oracle-instantclient${release}.${update}-devel oracle-instantclient${release}.${update}-sqlplus
RUN rm -rf /var/cache/

ENV LANG='en_US.UTF-8' LC_ALL='en_US.UTF-8'
ENV APP_ENV=dev
ENV LD_LIBRARY_PATH=/usr/lib/oracle/${release}.${update}/client64/lib/

WORKDIR /app
COPY . /app

RUN yum -y install python3
RUN pip3 install -r requirements.txt

ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["server"]
