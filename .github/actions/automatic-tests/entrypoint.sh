#!/bin/bash

/usr/share/mysql/mysql.server start
rake db:create
rake db:migrate
rake db:test:prepare
rake test