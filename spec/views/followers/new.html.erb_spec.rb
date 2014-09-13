require 'rails_helper'

RSpec.describe "followers/new", :type => :view do
  before(:each) do
    assign(:follower, Follower.new(
      :name => "MyString",
      :number => "MyString",
      :email => "MyString",
      :icon => "MyString"
    ))
  end

  it "renders new follower form" do
    render

    assert_select "form[action=?][method=?]", followers_path, "post" do

      assert_select "input#follower_name[name=?]", "follower[name]"

      assert_select "input#follower_number[name=?]", "follower[number]"

      assert_select "input#follower_email[name=?]", "follower[email]"

      assert_select "input#follower_icon[name=?]", "follower[icon]"
    end
  end
end
