require 'rails_helper'

RSpec.describe "events/edit", :type => :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :name => "MyString",
      :lat => 1.5,
      :lng => 1.5
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "input#event_name[name=?]", "event[name]"

      assert_select "input#event_lat[name=?]", "event[lat]"

      assert_select "input#event_lng[name=?]", "event[lng]"
    end
  end
end
