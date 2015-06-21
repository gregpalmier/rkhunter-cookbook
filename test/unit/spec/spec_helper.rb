# encoding: UTF-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'chefspec'
require 'chefspec/berkshelf'

at_exit { ChefSpec::Coverage.report! }
