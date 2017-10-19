# encoding: utf-8
require 'spec_helper'
require 'htmlentities'

ActionDispatch::Flash::FlashHash.class_eval do
  if Rails::VERSION::MAJOR == 3
    def discard?(key); @used.include?(key); end
  else
    def discard?(key); @discard.include?(key); end
  end
  def keep?(key); !discard?(key); end
end

describe FlashController, type: :controller do
  it "should display flash message on redirect" do
    post :redirect, type: :notice, message: 'Glow!'

    flash[:notice].should be == 'Glow!'
    flash.keep?(:notice).should be true
  end

  it "should display flash message on xhr" do
    xhr :get, :ajax, type: :notice, message: 'Glow!'

    flash[:notice].should be == 'Glow!'
    flash.discard?(:notice).should be true

    @response.headers['X-Message-Type'].should be == 'notice'
    HTMLEntities.new.decode(@response.headers['X-Message']).should be == 'Glow!'
  end

  it "should handle unicode on xhr" do
    xhr :get, :ajax, type: :notice, message: 'utf8: ✓'
    @response.headers['X-Message-Type'].should be == 'notice'
    HTMLEntities.new.decode(@response.headers['X-Message']).should be == 'utf8: ✓'
  end

  it "should not display flash message on xhr when skip_glow is set" do
    xhr :get, :ajax, type: :notice, message: 'utf8: ✓', skip_glow: true
    @response.headers.should_not have_key 'X-Message-Type'
  end

  it "should pass flash message on JSON requests" do
    get :ajax, type: :notice, message: 'Glow!', format: :json

    flash[:notice].should be == 'Glow!'
    flash.discard?(:notice).should be true

    @response.headers['X-Message-Type'].should be == 'notice'
    HTMLEntities.new.decode(@response.headers['X-Message']).should be == 'Glow!'
  end

  it "should not pass flash message on XML requests" do
    get :ajax, type: :notice, message: 'Glow!', format: :xml

    @response.headers['X-Message-Type'].should be_nil
    @response.headers['X-Message'].should be_nil
  end
end
