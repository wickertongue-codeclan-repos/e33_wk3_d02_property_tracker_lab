require('pg')

class PropertyManager

attr_reader :address, :id
attr_accessor :value, :number_of_bedrooms, :year_built

  def initialize(options)
    @address = options['address']
    @value = options['value'].to_i
    @number_of_bedrooms = options['number_of_bedrooms'].to_i
    @year_built = options['year_built'].to_i
    @id = options['id'].to_i if options['id']
  end

  def save()
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "
      INSERT INTO property_trackers (
        address,
        value,
        number_of_bedrooms,
        year_built
      )
    VALUES
    ($1, $2, $3, $4)
    RETURNING *
    "
    values = [@address, @value, @number_of_bedrooms, @year_built]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]["id"].to_i
    db.close()
  end

  def update()
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "
      UPDATE property_trackers
      SET
      (
        address,
        value,
        number_of_bedrooms,
        year_built
      ) =
      ($1, $2, $3, $4)
      WHERE id = $5
      "
      values = [@address, @value, @number_of_bedrooms, @year_built, @id]
      db.prepare("update", sql)
      db.exec_prepared("update", values)
      db.close()
  end

  def PropertyManager.delete_all
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "DELETE FROM property_trackers"
    db.prepare("delete_all", sql)
    db.exec_prepared("delete_all")
    db.close()
  end

  def PropertyManager.find_by_id(id_number)
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "
      SELECT * FROM property_trackers WHERE id = $1"
    values = [id_number]
    db.prepare("find_by_id", sql)
    result = db.exec_prepared("find_by_id", values)
    db.close()
    return PropertyManager.new(result[0])
  end

end

__END__

- update
- delete
-test test
