class MapRendersController < ApplicationController
  # GET /map_renders
  # GET /map_renders.xml
  def index
    @map_renders = MapRender.where(:status => 'pending')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @map_renders }
      format.txt
    end
  end

  # GET /map_renders/1.js
  def show
    @map_render = MapRender.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  # PUT /map_renders/1
  # PUT /map_renders/1.xml
  def update
    @map_render = MapRender.find(params[:id])

    respond_to do |format|
      if @map_render.update_attributes(params[:map_render])
        format.html { redirect_to(@map_render, :notice => 'Map render was successfully updated.') }
        format.xml  { head :ok }
        format.txt  { render :text => 'OK' }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @map_render.errors, :status => :unprocessable_entity }
        format.txt  { render :text => 'ERR: ' + @map_render.errors.full_messages.to_sentence }
      end
    end
  end

  def create
    @map = Map.find(params[:map_id])
    @map_render = @map.map_renders.create!
    redirect_to @map
  end
end
