class RemoveRemeberDigestFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :remeber_digest, :string
  end
end
