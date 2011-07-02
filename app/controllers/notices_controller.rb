class NoticesController < ApplicationController
  def index
    @notices = Notice.order("created_at DESC")
    @title = "Notices"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notices }
    end
  end

  def new
    @notice = Notice.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @notice }
    end
  end

  def publish
    notice = Notice.find(params[:id])
    notice.status = "published"
    notice.save

    redirect_to notices_path
  end

  def close
    notice = Notice.find(params[:id])
    notice.status = "closed"
    notice.save

    redirect_to notices_path
  end

  def edit
    @notice = Notice.find(params[:id])
  end

  def create
    @notice = Notice.new(params[:notice])

    respond_to do |format|
      if @notice.save
        format.html { redirect_to notices_path, notice: 'Notice was successfully created.' }
        format.json { render json: @notice, status: :created, location: @notice }
      else
        format.html { render action: "new" }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @notice = Notice.find(params[:id])

    respond_to do |format|
      if @notice.update_attributes(params[:notice])
        format.html { redirect_to notices_path, notice: 'Notice was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    notice = Notice.find(params[:id])
    notice.destroy

    respond_to do |format|
      format.html { redirect_to notices_path }
    end
  end
end
