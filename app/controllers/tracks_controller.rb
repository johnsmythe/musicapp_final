class TracksController < ApplicationController
include TracksHelper
before_filter:clear_list

def index
	@track = Track.new
	@tracks = Track.where(user_id: @user_id)
end

def create
	if is_url(params[:track][:query])	
		@trackinfo = getTrackInfo(params[:track][:query])
	else
		@trackinfo = youTubeQuery(params[:track][:query])

	end

	@track = Track.new(@trackinfo)
	@track.user_id = @user_id
	@tracks = Track.where(user_id: @user_id)
	@video_ids = Track.pluck(:video_id)	
	
	if @track.save
		puts "object able to be created"
	else
		#puts "random number is: #{@random}"
		puts "#{@track.errors.full_messages}"
		#render :action=>"index"
	end
end

def destroy
	@track = Track.find(params[:id])
	@track.destroy
end

def clear_list
	print "SHITSHITSHITHSHIT\n\n\SHITHISSHITHISHT\n\nSHITHSHIT"
	scheduler = Rufus::Scheduler.start_new
	print scheduler.inspect
	scheduler.in '1h' do
		Track.where(user_id: @user_id).destroy_all
    end
end

def retrieve
	Hirb.enable
	print Track.limit(100)
	puts "in this action"
	@tracklist = Track.where(user_id: @user_id).pluck(:video_id)
	@tracknames = Track.where(user_id: @user_id).pluck(:title)
	puts "done this action"
end
end

