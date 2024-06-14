require 'rails_helper'

RSpec.describe "contacts/show", type: :view do
  before(:each) do
    assign(:contact, Contact.create!(
      name: "Jane Doe",
      email: "jane.doe@example.com",
      phone: "123456789"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Jane Doe/)
    expect(rendered).to match(/jane.doe@example.com/)
    expect(rendered).to match(/123456789/)
  end
end
