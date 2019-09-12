class Teacher < ActiveRecord::Base
  has_many :yogas
  has_many :students, through: :yogas

end
