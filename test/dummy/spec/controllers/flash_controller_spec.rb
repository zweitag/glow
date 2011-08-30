# encoding: utf-8
require 'spec_helper'
require 'htmlentities'

ActionDispatch::Flash::FlashHash.class_eval do
  def discard?(key); @used.include?(key); end
  def keep?(key); !discard?(key); end
end

describe FlashController do
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
end
