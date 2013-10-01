class WorkssController < ApplicationController
  def index
    @works = Work.all
  end
end
