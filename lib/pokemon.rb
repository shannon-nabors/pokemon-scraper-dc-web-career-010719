require 'pry'
class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    new_p = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    Pokemon.new(id: new_p[0][0], name: new_p[0][1], type: new_p[0][2], hp: new_p[0][3], db: db)
  end

  def initialize(id:, name:, type:, hp:nil, db:)
    @id, @name, @type, @hp, @db = id, name, type, hp, db
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? where id = ?", new_hp, self.id)
  end

end
