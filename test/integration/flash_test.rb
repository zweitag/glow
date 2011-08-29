# encoding: utf-8
require 'test_helper'

class FlashTest < ActionDispatch::IntegrationTest

  include Capybara::DSL

  test "redirect" do
    visit root_path
    click_on 'redirect'
    assert page.has_content?('utf8: ✓')
  end

  test "ajax" do
    visit root_path
    click_on 'ajax'
    assert page.has_content?('ajax: ✓')
  end
end

