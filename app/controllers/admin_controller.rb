class AdminController < ApplicationController
  before_action :authenticate_user!, :admin_user
end