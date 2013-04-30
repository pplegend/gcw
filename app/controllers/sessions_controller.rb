#!/bin/env ruby
# encoding: utf-8
class SessionsController < ApplicationController
  def new
     @title="登录"
  end

  def create
     user=User.authenticate(params[:session][:email],params[:session][:password])
     if user.nil?
        flash.now[:error]="Invalid email/password combination"
        @title ='退出'
        render 'new'
     else
	sign_in user
	redirect_back_or user
     end
  end


  def destroy
     sign_out
     redirect_to root_path
  end

end
