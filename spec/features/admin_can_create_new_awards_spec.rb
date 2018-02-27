require 'rails_helper'

describe "As an admin" do
  before :each do
    @admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end
  describe "When I visit awards index" do
    describe "I see a form to create new awards, fill out form, click submit" do
      it "I see a list of awards I have created" do
        visit admin_awards_path
        fill_in "post_title", with: "Emmy"
        click_on "Create"

        expect(current_path).to eq(admin_awards_path)
        expect(page).to have_content("Emmy")
      end
    end
  end
end
