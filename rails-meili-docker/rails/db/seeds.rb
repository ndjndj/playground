
user_json = ActiveSupport::JSON.decode(File.read(
  Rails.root.join("db", "sample.json")
))

user_json.each do |d|
  User.create(
    uid: d["uid"],
    name: d["name"],
    name_ruby: d["name_ruby"],
    age: d["age"],
    pref: d["pref"],
    pref_code: d["pref_code"],
    tel: d["tel"],
    url: d["url"]
  )
end
