require 'test_helper'

class FlashControllerTest < ActionController::TestCase
  def test_redirect
    post :create, type: :notice, message: 'Glow!'
    assert_equal flash[:notice], 'Glow!'
    get :show # Flash survives
    assert_equal flash[:notice], 'Glow!'
  end

  def test_xhr
    xhr :post, :create, type: :notice, message: 'Glow!'
    assert_equal flash[:notice], 'Glow!'
    pending 'check headers'
    get :show # Flash is discarded
    assert flash.empty?
  end
end
