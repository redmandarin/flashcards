#!/usr/bin/env bash

# rvm and ruby
sudo yum install -y git curl gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison iconv-devel
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -L get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
rvm reload
rvm install 2.2.2
rvm use 2.2.2 --default

# postgresql
sudo yum install -y postgresql-server postgresql-contrib postgresql-libs postgresql-devel postgresql-plperl postgresql-plpython
sudo postgresql-setup initdb
chkconfig postgresql on
sudo service postgresql start
sudo systemctl start postgresql
sudo systemctl enable postgresql

# fix postgres user for localhost
sudo sed -i '80s/peer/trust/' /var/lib/pgsql/data/pg_hba.conf
sudo sed -i '82s/ident/trust/' /var/lib/pgsql/data/pg_hba.conf
sudo service postgresql restart

# js runtime
curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -
sudo yum install -y nodejs

# prepare app
cd sync
gem install bundler
gem install pg -v '0.18.2' -- --with-pg-config=/usr/bin/pg_config
bundle install --path vendor/cache
rake db:create
rake db:migrate

bundle exec rails server -b 0.0.0.0
