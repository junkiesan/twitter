class Timeline
  def initialize(users, scope = Tweet)
    @users = users
    @scope = scope
  end

  def tweets
    Tweet.
      where(user_id: timeline_ids).
      order(created_at: :desc)
  end

  def to_partial_path
    "timelines/timeline"
  end

  private

  attr_reader :users, :scope
end
