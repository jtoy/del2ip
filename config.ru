require 'rubygems'
require 'sinatra'
Sinatra::Application.set(
:run => false,
:enf => :production
)
require 'del2ip.rb'
run Sinatra::Application