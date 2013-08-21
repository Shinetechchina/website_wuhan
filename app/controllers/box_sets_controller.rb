class BoxSetsController < ApplicationController
  def create
    @box_set = BoxSet.new(params[:box_set])
    if @box_set.save
      respond_to do |format|
        format.js
      end
    else
      render js: "alert('Invalid page url')"
    end
  end

  def destroy
    @box_set = BoxSet.find(params[:id])
    if @box_set.url == "/"
    else
      @box_set.destroy
      render js: "$('#box-set-#{params[:id]}').remove()"
    end
  end
end
