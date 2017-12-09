class ChangeTypeOfGroupMembers < ActiveRecord::Migration[5.0]
  def change
    add_reference :group_members, :group, foreign_key: true
  end
end
