class User
  include TrackMe::Actor

  def self.existing_instance_method
    true
  end

  def id
    '1'
  end
end
