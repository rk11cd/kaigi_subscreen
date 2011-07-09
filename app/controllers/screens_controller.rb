require "open-uri"

class ScreensController < ApplicationController
  def top
    @screens = Screen.all
  end

  def index
    @screens = Screen.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @screens }
    end
  end

  def show
    @screen = Screen.find(params[:id])
    @title = @screen.description
    @fullscreen = true

    @channels = Hash[@screen.channels.group_by(&:group).map{|k,v| [k,v.map(&:name)] }]
    if @channels.include? "tweet"
      query = @channels["tweet"].join(",")
      @tweets = JSON.parse(open("http://search.twitter.com/search.json?q=#{URI.encode(query)}").read)["results"]
    end
    @notice = Notice.published.sample

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @screen }
    end
  end

  def new
    @screen = Screen.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @screen }
    end
  end

  def edit
    @screen = Screen.find(params[:id])
  end

  def create
    @screen = Screen.new(params[:screen])

    respond_to do |format|
      if @screen.save
        format.html { redirect_to @screen, notice: 'Screen was successfully created.' }
        format.json { render json: @screen, status: :created, location: @screen }
      else
        format.html { render action: "new" }
        format.json { render json: @screen.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @screen = Screen.find(params[:id])

    respond_to do |format|
      if @screen.update_attributes(params[:screen])
        format.html { redirect_to @screen, notice: 'Screen was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @screen.errors, status: :unprocessable_entity }
      end
    end
  end
end
