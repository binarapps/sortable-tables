class User < ActiveRecord::Base
  include RankedModel
  ranks :position
  def update_position
    if self.position < 0
      self.position = 0
      save
    end
  end
end
