require 'test_helper'

ActionDispatch::Flash::FlashHash.class_eval do
  def discard?(key); @used.include?(key); end
  def keep?(key); !discarded?(key); end
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
    pending 'check headers'
    assert flash.discard?(:notice), 'Discard flash.'
  end
end
