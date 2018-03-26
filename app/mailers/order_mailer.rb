class OrderMailer < ApplicationMailer
  default from: 'usman.sajed@gems.techverx.com'

 	def confirmation_email user, subject
	  	@email = user.email
  		mail(from: 'usman.sajed@gems.techverx.com',
         to: @email,
         subject: subject)
  end
end