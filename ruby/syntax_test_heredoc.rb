class Subscription
# ^ kwa    
  def warning_message
    <<-HEREDOC
      Subscription expiring soon!
      Your free trial will expire in #{days_until_expiration} days.
      Please update your billing information.
    HEREDOC
  end
  # ^ kwa
  
  def warning_message2
    <<~HEREDOC
      Subscription expiring soon!
      Your free trial will expire in #{days_until_expiration} days.
      Please update your billing information.
    HEREDOC
  end
end
# ^ kwa


%q(Joe said: )
# ^  ^       ^  str
end
# ^ kwa
%Q!Joe said:!
end
 %Q[Joe said:]
end
 %Q+Joe said:+
 end

%Q(Joe said: "Frank said: "#{what_frank_said}"")
# ^  ^       ^  str           ^ ipl
end
 %Q!Joe said: "Frank said: "#{what_frank_said}""!
end
 %Q[Joe said: "Frank said: "#{what_frank_said}""]
end
 %Q+Joe said: "Frank said: "#{what_frank_said}""+
