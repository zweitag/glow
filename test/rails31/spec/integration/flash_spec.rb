# encoding: utf-8
require 'spec_helper'

describe "the flash view" do
  it "redirects" do
    visit root_path
    click_on 'redirect'
    page.has_content?('utf8: ✓')
  end

  it "handles ajax" do
    visit root_path
    click_on 'ajax'
    page.has_content?('ajax: ✓')
  end
end

