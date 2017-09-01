class VideosController < Sinatra::Base

	set :root, File.join(File.dirname(__FILE__), "..")

	set :views, Proc.new { File.join(root, "views") }

	configure :development do
		register Sinatra::Reloader
	end

	$videos = [{
		id: 0,
		title: "Dog With Sunglasses",
		description: "A dog rides in a car with sunglasses. It's pretty dope.",
		code: "<iframe width='854' height='480' src='https://www.youtube.com/embed/yp7ABJESOsA' frameborder='0' allowfullscreen></iframe>"
	},
	{
		id: 1,
		title: "Dog With Hat",
		description: "A dog wearing a hat. Very dapper.",
		code: "<iframe width='854' height='480' src='https://www.youtube.com/embed/CF703fiyewA' frameborder='0' allowfullscreen></iframe>"
	},
	{
		id: 2,
		title: "Dog doing karate",
		description: "This dog knows karate. Watch out.",
		code: "<iframe width='854' height='480' src='https://www.youtube.com/embed/noRSyXRCBUw' frameborder='0' allowfullscreen></iframe>"
	}]

	# INDEX - DONE!
	get "/videos" do
		@video = $videos
		erb :"/videos/index"
	end

	# NEW - DONE!
	get "/videos/new" do
		erb :"/videos/new"
	end

	# SHOW - DONE!
	get "/videos/:id" do
		id = params[:id]
		@video = $videos[id.to_i]
		erb :"/videos/show"
	end

	# CREATE - DONE!
	post "/videos" do
		title = params[:title]
		description = params[:description]
		code = params[:code]
		new_video = {
			id: $videos.length,
			title: title,
			description: description,
			code: code
		}
		$videos.push(new_video)
		redirect :"/videos"
	end

	# EDIT - DONE!
	get "/videos/:id/edit" do
		id = params[:id]
		@video = $videos[id.to_i]
		erb :"/videos/edit"
	end

	# UPDATE - DONE!
	put "/videos/:id" do
		id = params[:id].to_i
		video = $videos[id]
		video[:title] = params[:title]
		video[:description] = params[:description]
		$videos[id] = video
		redirect :"/videos/#{id}"

	end

	# DELETE - DONE!
	delete "/videos/:id" do
		id = params[:id]
		video = $videos[id.to_i]
		$videos.delete(video)
		redirect :"/videos"
	end

end