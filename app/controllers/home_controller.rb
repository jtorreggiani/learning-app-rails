# frozen_string_literal: true

# Handles render home page and redirects to
# dashboard if user is signed in
class HomeController < ApplicationController
  # Renders the home page
  def index
    return unless user_signed_in?

    redirect_to dashboard_path
  end
end
