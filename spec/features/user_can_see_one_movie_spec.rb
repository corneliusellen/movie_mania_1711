require 'rails_helper'

describe "user sees one movie's award information" do
  before :each do
    @movie_1 = create(:movie)
    @movie_2 = create(:movie, title: "Guardians of the Galaxy")
    @award_1 = create(:award, title: "Best Picture")
    @award_2 = create(:award, title: "Best Sound")
    @award_3 = create(:award, title: "Best Action Film")
    @movie_2.awards << [@award_1, @award_2, @award_3]
    @best_picture_guardians = MovieAward.find_by(award_id: @award_1.id, movie_id: @movie_2.id)
    @best_picture_guardians.update(year: 1991)
  end
  describe "user links to specific movie from movies index page" do
    it "user sees Best Picture, Best Sound, Best Action Film under an Awards for this Movie heading and ssees what year the award was won" do
      visit director_movies_path(@movie_2.director)
      click_on "Guardians of the Galaxy"

      expect(current_path).to eq(movie_path(@movie_2.slug))
      expect(page).to have_content(@award_1.title)
      expect(page).to have_content(@award_2.title)
      expect(page).to have_content(@award_3.title)
      expect(page).to have_content(@best_picture_guardians.year)
    end
  end
end
