class HomeController < ApplicationController
    def index
      redirect_to appointments_path      
    end
  end