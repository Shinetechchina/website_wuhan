class Refinery::BoxesController < ApplicationController

  include CustomBoxesHelper
  include ActionView::Helpers::FormOptionsHelper

  before_filter :require_user

  def select_type
    klass_name = params[:boxable_type]
    render inline: select_box_name_by(klass_name)
  end

  def create
    @box = Box.new(params[:box])
    @box.set_template
    @box.add_position
    respond_to do |format|
      if @box.save
        format.html { redirect_to '/' }
        flash[:notice] = "create box successful !"
      else
        flash[:error] = @box.errors.to_a.join(';')
        format.html { redirect_to '/' }
      end
    end
  end

  def select_url
    @box = Box.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update_url
    @box = Box.find(params[:id])
    respond_to do |format|
      if @box.update_attributes(params[:box])
        format.js
      end
    end
  end


  def destroy
    @box = Box.find(params[:id])
    @box.destroy
    render inline: 'destroy successful'
  end
end
