require 'rails_helper'

RSpec.describe "contacts/index", type: :view do
  before(:each) do
    assign(:contacts, [
      Contact.create!(
        name: "John Doe",
        email: "john.doe@example.com",
        phone: "987654321"
      ),
      Contact.create!(
        name: "Jane Doe",
        email: "jane.doe@example.com",
        phone: "123456789"
      )
    ])
  end

  it "renders a list of contacts" do
    render
    cell_selector = 'tr>td'
    assert_select cell_selector, text: Regexp.new("John Doe"), count: 1
    assert_select cell_selector, text: Regexp.new("john.doe@example.com"), count: 1
    assert_select cell_selector, text: Regexp.new("987654321"), count: 1
  end
end
