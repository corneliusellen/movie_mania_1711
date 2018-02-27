require 'rails_helper'

describe Award, type: :model do
  describe "relationships" do
    it { is_expected.to have_many(:movies).through(:movie_awards) }
  end
end
