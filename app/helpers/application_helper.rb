module ApplicationHelper

	def form_group_tag(errors)
		if errors.any?
			'form-group has-error'
		else
			'form-group'
		end
	end

	def vote_link_classes(post, direction)
		case direction
			when "up"
				"glyphicon glyphicon-chevron-up #{(current_user.voted(post) && current_user.voted(post).up_vote?) ? 'voted' : ' ' }"
		    when "down"
		    	"glyphicon glyphicon-chevron-down #{(current_user.voted(post) && current_user.voted(post).down_vote?) ? 'voted' : ' ' }"
	    end
	end


end
