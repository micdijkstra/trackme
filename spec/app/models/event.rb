class Event
  include TrackMe::Event

  def initialize(data={})
    @actor = data[:actor]
    @category = data[:category]
    @label = data[:label]
    @value = data[:value]
  end

  def save
  end

  def actor
    @actor
  end

  def category
    @category
  end

  def label
    @label
  end

  def value
    @value
  end
end
