class CreateCardTags < ActiveRecord::Migration
  def change
    create_table :card_tags, id: false do |t|
      t.belongs_to :card
      t.belongs_to :tag
    end
  end
end
