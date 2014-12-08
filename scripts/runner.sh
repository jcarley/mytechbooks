#!/usr/bin/env bash

/vagrant/scripts/base.sh
/vagrant/scripts/database.sh
sudo -u vagrant -H bash -c "/vagrant/scripts/ruby.sh"

