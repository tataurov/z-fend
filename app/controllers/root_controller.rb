class RootController < ApplicationController
  @users = User.all
end
