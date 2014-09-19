class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
    	t.has_attached_file :image
    	t.text :description
    	t.belongs_to :user
    	t.belongs_to :property

    	t.timestamps
    end
  end
end
