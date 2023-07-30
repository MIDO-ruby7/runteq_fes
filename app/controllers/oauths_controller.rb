require 'octokit'

class OauthsController < ApplicationController
  include Rails.application.routes.url_helpers
  skip_before_action :require_login, only: %i[oauth callback]

  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    client = Octokit::Client.new(:access_token => ENV['GITHUB_PERSONAL_ACCESS_TOKEN'])
    if (@user = login_from(provider)) && client.organization_member?('runteq', @user.name )
      redirect_to posts_path,  notice: t('.success')
    else
      begin
        # 特定の組織にユーザーが所属しているかどうかを確認する
        @user = create_from(provider)
        if client.organization_member?('runteq', @user.name )
          reset_session
          auto_login(@user)
          redirect_to edit_user_path(@user),  notice: t('.success')
        else
          redirect_to root_path, alert: t('.no_organization')
        end
      rescue
        redirect_to root_path, alert: t('.fail')
      end
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: t('.success')
  end
end
