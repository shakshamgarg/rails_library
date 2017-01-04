class Subject < ApplicationRecord
 has_many:books
 self.primary_key='id'
end
