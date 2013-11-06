class MessageMailer < ActionMailer::Base
  default charset: "utf-8"
  default content_type: "text/html"

  def comment_message(message_id, user)
    @message = Refinery::Messages::Message.find_by_id(message_id)
    return false if @message.blank?
    #Refinery::User.all.each do |user|
      mail(
        from: 'shinetech_wuhan@163.com',
        to: user.email,
        subject: "#{@message.name} comment a message"
      )
    #end
  end
end
