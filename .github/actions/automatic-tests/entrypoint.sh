#!/bin/bash
cat app/controllers/application_controller.rb
/usr/share/mysql/mysql.server start
rake db:create
rake db:migrate
rake db:test:prepare
rake test
