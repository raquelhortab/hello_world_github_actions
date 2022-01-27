FROM centos:7
MAINTAINER raquelhortab@gmail.com

RUN yum -y update

RUN yum -y install curl tar file xz-utils git which
RUN curl --silent --location https://rpm.nodesource.com/setup_8.x | bash -
RUN curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo
RUN yum -y install yarn

# install rvm
RUN yum -y install gcc-c++ patch readline readline-devel zlib zlib-devel
RUN yum -y install libyaml-devel libffi-devel openssl-devel make
RUN yum -y install bzip2 autoconf automake libtool bison iconv-devel
RUN gpg --keyserver keyserver.ubuntu.com --recv-key 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
#RUN gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN curl -L get.rvm.io | bash -s stable
RUN source /etc/profile.d/rvm.sh
RUN /bin/bash -l -c "echo 'yes' | rvm implode"
RUN curl -sSL https://get.rvm.io | bash -s -- --version 1.29.7
RUN /bin/bash -l -c "rvm reload && rvm install ruby-1.9.3"

# Copy the main application.
RUN mkdir -p /app
WORKDIR /app
COPY . ./


# MySQL and MariaDB
RUN yum -y install initscripts && yum clean all
RUN mkdir -p /etc/yum.repos.d
RUN yum -y install tree && tree .
RUN cp /app/.github/actions/automatic-tests/MariaDB.repo /etc/yum.repos.d
RUN yum -y install MariaDB-server MariaDB-client
RUN systemctl enable mariadb
RUN mysql --version
RUN yum -y install mariadb-devel
RUN yum -y install mysql-devel
RUN yum -y install MariaDB-shared
RUN /bin/bash -l -c "gem install mysql2 -v '0.4.10'"


RUN /bin/bash -l -c "gem install bundler -v 1.16.2 && bundle install --jobs 20 --retry 5"

RUN echo '# some comment' | cat - app/controllers/application_controller.rb > temp && mv temp app/controllers/application_controller.rb 

EXPOSE 3000

RUN chmod 755 /app/.github/actions/automatic-tests/entrypoint.sh

ENTRYPOINT /bin/bash -l -c "/app/.github/actions/automatic-tests/entrypoint.sh"
USER root
