class SupportMailer < ActionMailer::Base
  default from: "no-reply@solbog.com"

	def notify sender, title, body
		@sender = sender
		@title = title
		@body = body
    mail(:to => "alvinwalterson@gmail.com",
         :from => @sender,
         :subject => "Solblog Support : #{@title}")
	end
end
