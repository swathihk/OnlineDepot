class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all(:include => [:photos, :photographer])
     @roles=Role.all
  end
end
