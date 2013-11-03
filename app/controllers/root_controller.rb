class RootController < ApplicationController
  @users = User.all

  def index
    @lasts_works = Work.all.sort_by(&:date).reverse!
  end

end
