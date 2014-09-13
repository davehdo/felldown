require 'rails_helper'

RSpec.describe "followers/show", :type => :view do
  before(:each) do
    @follower = assign(:follower, Follower.create!(
      :name => "Name",
      :number => "Number",
      :email => "Email",
      :icon => "Icon"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Icon/)
  end
end
