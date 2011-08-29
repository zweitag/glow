# encoding: utf-8
require 'test_helper'

ActionDispatch::Flash::FlashHash.class_eval do
  def discard?(key); @used.include?(key); end
  def keep?(key); !discard?(key); end
end

class FlashControllerTest < ActionController::TestCase
  def test_redirect
    post :create, type: :notice, message: 'Glow!'
    assert_equal flash[:notice], 'Glow!'
    assert flash.keep?(:notice), 'Keep flash.'
  end

  def test_xhr
    xhr :post, :create, type: :notice, message: 'Glow!'
    assert_equal flash[:notice], 'Glow!'
    assert flash.discard?(:notice), 'Discard flash.'
    assert_equal @response.headers['X-Message'], 'Glow!'
    assert_equal @response.headers['X-Message-Type'], :notice
  end

  def test_utf8
    xhr :post, :create, type: :notice, message: 'utf8: ✓'
    assert_equal @response.headers['X-Message'], 'utf8: ✓'
  end
end
