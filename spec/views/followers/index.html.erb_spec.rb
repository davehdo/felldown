require 'rails_helper'

RSpec.describe "followers/index", :type => :view do
  before(:each) do
    assign(:followers, [
      Follower.create!(
        :name => "Name",
        :number => "Number",
        :email => "Email",
        :icon => "Icon"
      ),
      Follower.create!(
        :name => "Name",
        :number => "Number",
        :email => "Email",
        :icon => "Icon"
      )
    ])
  end

  it "renders a list of followers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Icon".to_s, :count => 2
  end
end
