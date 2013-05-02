class VerifyController < ApplicationController
  
  def index
    # Don't like the globals? Fix them and pull request.
    # This project is a dirty hack to help someone with a
    # client side script.
    @@global_hash ||= {}
    oauth_token = params[:oauth_token]
    oauth_verifier = params[:oauth_verifier]
    @@global_hash[oauth_token] = oauth_verifier
  end
  
  def show
    oauth_token = params[:k].to_s
    if @@global_hash.has_key? oauth_token
      render :text => @@global_hash[oauth_token]
    else
      not_found
    end
  end
end
