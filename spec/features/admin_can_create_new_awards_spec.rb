require 'rails_helper'

describe "As an admin" do
  describe "When I visit awards index" do
    describe "I see a form to create new awards, fill out form, click submit" do
      it "I see a list of awards I have created" do
        visit awards_path

        fill_in "award[title]", with: "Emmy"
        click_on "Submit"

        expect(current_path).to eq(awards_path)
        expect(page).to have_content("Emmy")
      end
    end
  end
end
