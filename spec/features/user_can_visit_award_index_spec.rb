require 'rails_helper'

describe "As a Visitor" do
  before :each do
    @award_1 = create(:award)
    @award_2 = create(:award, title: "Grammy")
  end
  describe "When I visit the awards index" do
    it "I cannot see the form to create a new award and I can see all the awards" do
      visit awards_path

      expect(page).to have_link(@award_1.title)
      expect(page).to have_link(@award_2.title)
    end
  end
end
