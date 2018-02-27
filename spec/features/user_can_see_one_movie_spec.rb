require 'rails_helper'

describe "user sees one movie" do
  it "user sees one movie with title and description" do
    movie = create(:movie)

    visit movie_path(movie.slug)

    expect(current_path).to eq(movie_path(movie.slug))

    expect(page).to have_content(movie.title)
    expect(page).to have_content(movie.description)
  end
end

describe "user sees one movie's award information" do
  before :each do
    @movie_1 = create(:movie)
    @movie_2 = create(:movie, title: "Guardians of the Galaxy")
    @award_1 = create(:award, title: "Best Picture")
    @award_2 = create(:award, title: "Best Sound")
    @award_3 = create(:award, title: "Best Action Film")
    @movie_2.awards << [@award_1, @award_2, @award_3]
  end
  describe "user links to specific movie from movies index page" do
    it "user sees Best Picture, Best Sound, Best Action Film under an Awards for this Movie heading and ssees what year the award was won" do
      visit director_movies_path(@movie_2.director)
      click_on "Guardians of the Galaxy"

      expect(current_path).to eq(movie_path(@movie_2.slug))
      expect(page).to have_content()
    end
  end
end
