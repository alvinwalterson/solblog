class SupportMailer < ActionMailer::Base
  default from: "no-reply@solbog.com"

	def notify sender, title, body
		@sender = sender
		@title = title
		@body = body
    mail(:to => "thesimplesol@gmail.com",
         :from => @sender,
         :subject => "Simple Sole Blog Support : #{@title}")
	end
end
