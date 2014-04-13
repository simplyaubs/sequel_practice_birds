Sequel.migration do
  up do
    add_column(:birds, :color, String)
  end

  down do
    drop_column(:birds, :color)
  end
end