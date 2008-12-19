$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require "rubygems"
require "activesupport"
require "goaloc/app"
require "goaloc/model"
require "goaloc/generators/generator"
require "goaloc/generators/rails"
require "goaloc/generators/merb"

module Goaloc
end

APP = @app = App.new

def generate(*args)
  @app.log << "generate #{args.inspect[1..-2]}"
  @app.generate(*args)
end

def route(*args)
  @app.log << "route #{args.inspect[1..-2]}"
  @app.route(*args)
end

def add_attrs(h)
  @app.log << "add_attrs #{h.inspect}"
  @app.add_attrs(h)
end

def name=(name)
  @app.log << "name= #{name.inspect}"
  @app.name = name
end
