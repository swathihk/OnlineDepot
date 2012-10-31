require 'developer'
class GalleriesController < ApplicationController
     include Developer
  def index
    @galleries = Gallery.all(:include => [:photos, :photographer])
     @roles=Role.all
  end
  def module_test
    #@a=Developer::Tech_support.bpo
    #@b=Developer.software
    #@c=Developer:Testing.testing_one
    #@d= Developer.content_developer
  end
  def  accordion

  end
end
