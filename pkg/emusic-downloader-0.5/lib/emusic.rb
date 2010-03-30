require 'rubygems'
require 'hpricot'
require 'open-uri'

class EMusicUtility

	def EMusicUtility.download_media(filename, options = {})
	# The method that does all of the downloading

		# First, check if the file that we want to download from exists, if it does process it
		if File.exists? filename
			doc = Hpricot.XML(open(filename))

			# If the directory flag isn't set, save the album as ARIST - ALBUM
			if !options[:directory]
				directory = "#{(doc.at("ARTIST")).inner_html} - #{(doc.at("ALBUM")).inner_html}"
				if !File.directory? directory
					FileUtils.mkdir directory
				end

			# If the directory flag is set
			else
				directory = options[:directory]
				if ((options[:force_create] == true) && (!File.directory? directory))
					FileUtils.mkdir directory
				end
			end

			if !File.directory? directory
				puts "emusic: Directory #{directory} not found, use the -D switch to force the creation of it"
				exit 1
			end

			if (options[:verbose] == true)
				puts "emusic: Downloading to: " + directory + "/"
			end

			# download the tracks
			tracks = (doc/:TRACK)

			if tracks.size>0
				tracks.each do |track|
					title = (track/:TITLE).inner_html
					title = title.gsub(/\//, '\\')
					title = title.gsub(/&#039;/, "'")
					if (options[:verbose] == true)
						puts "emusic: Downloading #{title}"
					end
					open(directory + "/" + title + ".mp3","w").write(open((track/:TRACKURL).inner_html).read) 
				end
				if (options[:verbose] == true)
					puts "emusic: Download complete!"
				end
			else
				puts "emusic: No downloads found in file: #{filename}"
			end

			if options[:remove] == true
				File.delete(filename)
				if (options[:verbose] == true)
					puts "emusic: Removed File #{filename}"
				end
			end
		else
			puts "emusic: File #{filename} not found"
			exit
		end
	end
end

