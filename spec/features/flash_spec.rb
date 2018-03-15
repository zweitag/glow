# encoding: utf-8
require 'spec_helper'

describe "the flash view", type: :feature do
  it "redirects" do
    visit root_path
    click_on 'redirect'
    page.should have_content('utf8: ✓')
  end

  it "handles rails ajax" do
    visit root_path
    click_on 'rails ajax'
    page.should have_content('rails ajax: ✓')
  end

  it "handles jquery ajax" do
    visit root_path
    click_on 'jquery ajax'
    page.should have_content('jquery ajax: ✓')
  end
end
