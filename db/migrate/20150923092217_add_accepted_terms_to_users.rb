class AddAcceptedTermsToUsers < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.boolean :accepted_terms
    end
  end
end
