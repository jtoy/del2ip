#written by Jason Toy http://jtoy.net

require 'rubygems'
require 'sinatra'
require 'www/delicious'
require 'instapaper'
require 'haml'
require 'activerecord'



get '/' do
 haml :index
end

post '/' do
  @post = true
  Thread.new{
    d = WWW::Delicious.new(params[:d_u], params[:d_p])
    i = Instapaper::Base.new(params[:i_u],params[:i_p])
    r = i.authenticate
    if params[:d_t].to_s.strip.empty?
      posts = d.posts_all
    else
      posts = params[:d_t].split(" ").collect{|tag| d.posts_all(:tag => tag) }.flatten.uniq
    end
    if r.code == 200
      posts.each{|p| i.add p.url.to_s }
    end
  }
  haml :index
end


class Url < ActiveRecord::Base
  validates_presence_of :link
end

class InstapaperUser < ActiveRecord::Base
  validates_presence_of :login
end
