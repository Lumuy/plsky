class CreateSmsVerifications < ActiveRecord::Migration[5.1]
  def change
    create_table :sms_verifications do |t|
      t.string :phone_number
      t.string :verification_code

      t.timestamps
    end
  end
end
