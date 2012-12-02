class FlashController < ApplicationController
  def show
    # show.html.erb
  end

  def redirect
    flash[params[:type].to_sym] = params[:message]
    redirect_to action: 'show'
  end

  def ajax
    respond_to do |wants|
      wants.js {
        flash[params[:type].to_sym] = params[:message]
        head :ok
      }
    end
  end
end
