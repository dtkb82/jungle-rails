class UserMailer < ApplicationMailer
	default from: 'notifications@example.com'

	def welcome_email(user, order)
		@user = user
		@order = order
		@url = 'http://localhost:3000/login'
		mail(to: @order.email, subject: "Welcome to the Jungle! Your order id:#{@order.id}")	
	end
end
