module TrackMeHelper
  def user
    @user ||= User.new
  end

  def event
    @event ||= Event.new({ actor: user }.merge(data))
  end

  def data
    { category: 'View', label: 'Homepage', value: '1' }
  end
end
