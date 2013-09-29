class Event
  include TrackMe::Event

  def initialize(data={})
    @actor = data[:actor]
    @category = data[:category]
    @label = data[:label]
    @value = data[:value]
    @created_at = data[:created_at]
  end

  def save
  end
end
