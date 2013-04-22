class FlashController < ApplicationController

  headerize_flash_for :json

  def show
    # show.html.erb
  end

  def redirect
    flash[params[:type].to_sym] = params[:message]
    redirect_to action: 'show'
  end

  def ajax
    respond_to do |wants|
      [:js, :json, :xml].each do |fmt|
        wants.send(fmt) {
          flash[params[:type].to_sym] = params[:message]
          flash[:skip_glow] = params[:skip_glow].present?
          head :ok
        }
      end
    end
  end
end
