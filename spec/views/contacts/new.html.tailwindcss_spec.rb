require 'rails_helper'

RSpec.describe "contacts/new", type: :view do
  before(:each) do
    assign(:contact, Contact.new(
      name: "Jane Doe",
      email: "jane.doe@example.com",
      phone: "123456789"
    ))
  end

  it "renders new contact form" do
    render

    assert_select "form[action=?][method=?]", contacts_path, "post" do

      assert_select "input[name=?]", "contact[name]"

      assert_select "input[name=?]", "contact[email]"

      assert_select "input[name=?]", "contact[phone]"
    end
  end
end
