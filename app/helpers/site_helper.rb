module SiteHelper
	def excerpt(post, length)
		post = sanitize(post)
		if post.length < length
			post
		else
			post[0..length-1] << "..."
		end
	end
end
