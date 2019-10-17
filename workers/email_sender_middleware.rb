require_relative '../config/pony'

class EmailSender
    def self.email_sender(user)
        body = 'Hi You'
        Pony.mail(to: user.email, subject: 'Registration successful', body: body)
    end
end
