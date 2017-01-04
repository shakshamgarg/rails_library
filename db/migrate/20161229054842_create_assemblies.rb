class CreateAssemblies < ActiveRecord::Migration[5.0]
  def change
    create_table :assemblies do |t|
      t.string :name	  		

      t.timestamps
    end
	
	create_table :parts do |t|
      t.string :part_number	  		
      t.timestamps
    end
	
	create_table :assemblies_parts , id:false do |t|
	  t.belongs_to :assembly ,index: true
	  t.belongs_to :part ,index: true
	end
	
  end
end
