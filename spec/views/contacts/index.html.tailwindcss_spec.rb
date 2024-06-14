require 'rails_helper'
include Pagy::Backend

RSpec.describe "contacts/index", type: :view do
  before(:each) do
    Contact.create!(name: "John Doe", email: "john.doe@example.com", phone: "987654321")
    Contact.create!(name: "Jane Doe", email: "jane.doe@example.com", phone: "123456789")
    Contact.create!(name: "Alice Smith", email: "alice.smith@example.com", phone: "111111111")
    Contact.create!(name: "Bob Johnson", email: "bob.johnson@example.com", phone: "222222222")
    @pagy, @contacts = pagy(Contact.all, items: 2)  # Set the number of items per page

    assign(:pagy, @pagy)
    assign(:contacts, @contacts)
  end

  it "renders a list of contacts with pagination" do
    render
    cell_selector = 'tr>td'
    assert_select cell_selector, text: Regexp.new("John Doe"), count: 1
    assert_select cell_selector, text: Regexp.new("john.doe@example.com"), count: 1
    assert_select cell_selector, text: Regexp.new("987654321"), count: 1
    assert_select cell_selector, text: Regexp.new("Jane Doe"), count: 1
    assert_select cell_selector, text: Regexp.new("jane.doe@example.com"), count: 1
    assert_select cell_selector, text: Regexp.new("123456789"), count: 1

    # Check for pagination controls
    assert_select 'nav.pagy', count: 1
  end
end
