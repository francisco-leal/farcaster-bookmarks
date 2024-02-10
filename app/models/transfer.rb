class Transfer < ApplicationRecord
  belongs_to :user
  belongs_to :caster, class_name: 'User', foreign_key: :caster_id, optional: true
end
