require 'rails_helper'

RSpec.describe "followers/edit", :type => :view do
  before(:each) do
    @follower = assign(:follower, Follower.create!(
      :name => "MyString",
      :number => "MyString",
      :email => "MyString",
      :icon => "MyString"
    ))
  end

  it "renders the edit follower form" do
    render

    assert_select "form[action=?][method=?]", follower_path(@follower), "post" do

      assert_select "input#follower_name[name=?]", "follower[name]"

      assert_select "input#follower_number[name=?]", "follower[number]"

      assert_select "input#follower_email[name=?]", "follower[email]"

      assert_select "input#follower_icon[name=?]", "follower[icon]"
    end
  end
end
