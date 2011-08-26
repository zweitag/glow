class FlashController < ApplicationController
  def show
    # show.html.erb
  end

  def create
    flash[params[:type]] = params[:message]
    respond_to do |wants|
      wants.html { redirect_to action: 'show' }
      wants.js # create.js.erb
    end
  end
end
