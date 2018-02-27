class Admin::AwardsController < Admin::BaseController

  def index
    @award = Award.new
    @awards = Award.all
  end

  def create
    @award = Award.new(award_params)
    if @award.save
      redirect_to admin_awards_path
    else
      render :create
    end
  end

  private

  def award_params
    params.require(:post).permit(:title)
  end

end
