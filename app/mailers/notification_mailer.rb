class NotificationMailer < ApplicationMailer
  default from: "no-reply@nomsterapp.com"

  def comment_added
    mail(to: "cory.hack@gmail.com",
          subject: "A cooment has been added to your place")
  end
end
