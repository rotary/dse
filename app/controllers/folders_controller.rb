# -*- coding: utf-8 -*-
class FoldersController < ApplicationController
  
  def index
  end

  def upload

    redirect_to :action => :new
  end

  def new
    @folder = Folder.new({:sponsor_district => "1690", :sponsor_ye_chair_name => "BAUMON Philippe", :sponsor_ye_chair_email => "yeo-chairman@rotary1690.org"}.merge(params[:folder] || {}))
  end

  def create
    @folder = Folder.new(params[:folder])
    if @folder.save
      redirect_to root_url, :success => "C'est enregistré"
    end
  end

end
