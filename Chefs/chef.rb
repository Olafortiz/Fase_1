require 'sqlite3'

class Chef

  def initialize(first_name, last_name, birthday, email, phone, created_at, updated_at)
    @first_name = first_name
    @last_name = last_name
    @birthday = birthday
    @email = email
    @phone = phone
    @created_at = created_at
    @updated_at = updated_at
  end

  def self.create_table
    Chef.db.execute(
      <<-SQL
        CREATE TABLE chefs (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          first_name VARCHAR(64) NOT NULL,
          last_name VARCHAR(64) NOT NULL,
          birthday DATE NOT NULL,
          email VARCHAR(64) NOT NULL,
          phone VARCHAR(64) NOT NULL,
          created_at DATETIME NOT NULL,
          updated_at DATETIME NOT NULL
        );
      SQL
    )
  end

  def self.seed
    Chef.db.execute(
      <<-SQL
        INSERT INTO chefs
          (first_name, last_name, birthday, email, phone, created_at, updated_at)
        VALUES
          ('Ferran', 'Adriá', '1985-02-09', 'ferran.adria@elbulli.com', '42381093238', DATETIME('now'), DATETIME('now')),
          ('Samuel', 'Pérez', '1996-10-01', 'sam_ulises_96@hotmail.es', '18954975415', DATETIME('now'), DATETIME('now')),
          ('Alfonso', 'Elias','1987-05-14', 'poncho_313@live.com.mx', '12345678914', DATETIME('now'), DATETIME('now'));
      SQL
    )
  end

  def self.all
    @db_reader = SQLite3::Database.open("chefs.db")
    selector = @db_reader.prepare "SELECT * FROM chefs"
    chef_table = selector.execute 
    chef_table.each do |chef|
      puts chef.join(' ')
    end
  end

  def where(argument_1, argument_2)
      puts Chef.db.execute(
      <<-SQL
        SELECT * FROM chefs Where "#{argument_1}" = "#{argument_2}";
        SQL
        ).join(' ')
  end

  def save
    Chef.db.execute(
      <<-SQL
        INSERT INTO chefs
          (first_name, last_name, birthday, email, phone, created_at, updated_at)
        VALUES
          ('#{@first_name}', '#{@last_name}', '#{@birthday}', '#{@email}','#{@phone}', DATETIME('now'), DATETIME('now'));
      SQL
    )
  end
  
  def self.delete(num_id)
    Chef.db.execute(
    "DELETE FROM chefs WHERE id = ?", num_id
    )
  end


  private

  def self.db
    @@db ||= SQLite3::Database.new("chefs.db")
  end

end

Chef.all