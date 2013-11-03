class RootController < ApplicationController
  @users = User.all

  def index
    @lasts_works = Work.take(4).sort_by(&:date).reverse!
  end

end
