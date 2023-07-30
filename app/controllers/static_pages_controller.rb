class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top]
  layout 'top'

  def top
  end
end
