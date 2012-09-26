# -*- coding: utf-8 -*-
class FoldersController < ApplicationController
  
  def index
  end

  def upload

    redirect_to :action => :new
  end

  def new
    @folder = Folder.new(params[:folder])
  end

  def create
    @folder = Folder.new(params[:folder])
    if @folder.save
      redirect_to root_url, :success => "C'est enregistré"
    end
  end

end
