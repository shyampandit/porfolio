class AddGalleryTogalleryphotos < ActiveRecord::Migration
  def change
  	   add_reference :galleryphotos, :galleries, index: true
  end
end
