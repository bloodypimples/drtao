class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def remove_dot_from_name
    self.name = self.name.tr('.', '')
  end

  def remove_dot_from_title
    self.title = self.title.tr('.', '')
  end
end
