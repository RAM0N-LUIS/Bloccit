class FavoriteMailer < ActionMailer::Base
  default from: "ramonlrodriguez@gmail.com"

  def new_comment(user, post, comment)

  	headers["Message-ID"] = "<comments/#{comment.id}@ram0n-luis-bloccit.com"
  	headers["In-Reply_To"] = "<post/#{post.id}@ram0n-luis-bloccit.com"
  	headers["References"] = "<post/#{post.id}@ram0n-luis-bloccit.com"

  	@user = user
  	@post = post
  	@comment = comment

  	mail(to: user.email, subject: "New comment on #{post.title}")
  end

end
