class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :id, :null => false, comment: "id"
      t.string :name, :null => false, comment: "名前"
      t.string :name_ruby, comment: "名前(フリガナ)"
      t.integer :age, comment: "年齢"
      t.string :pref, comment: "都道府県"
      t.integer :pref_code, comment: "都道府県コード"
      t.string :tel, comment: "電話番号"
      t.string :url, comment: "URL"
      t.timestamps
    end
  end
end
