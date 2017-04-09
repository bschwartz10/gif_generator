class CreateFavorite < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :gif, foreign_key: true
    end
  end
end
