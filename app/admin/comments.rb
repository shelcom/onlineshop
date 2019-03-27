ActiveAdmin.register Comment, as: "UserComment" do
  index do
    selectable_column
    column :id
    column :name
    column :comment
    column :instrument_id
    column :user_id
    actions
  end
end
