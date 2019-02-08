# frozen_string_literal: true

# The WidgetFactory module for all of the widgets
module WidgetFactory
  # The Database class is responsible for connecting to the widgets database and
  # sending SQL commands to the widgets database.
  class Database
    def initialize
      @filename = config['filename']
      raise 'Database file not found' if @filename.nil?
    end

    # Returns all rows in the widgets table.
    def all
      connection.execute DB_SELECT_ALL_SQL
    end

    # Inserts a row into the widgets table.
    def create(name:, color:)
      return if name.nil? || name.strip == ''
      return if color.nil? || color.strip == ''
      sname = sanitize(name)
      scolor = sanitize(color)
      connection.execute DB_INSERT_SQL, [sname, sname]
    end

    # Truncates the widgets table.
    def truncate!
      connection.execute DB_TRUNCATE_SQL
    end

    private

    # Accessor to the @connection instance method. If not set, call
    # #initialize_database.
    def connection
      @connection ||= initialize_database
    end

    # Reads the DBCONFIG file and returns hash per the current RACK_ENV
    def config
      @config ||= begin
        raise 'RACK_ENV not set' if ENV['RACK_ENV'].nil?
        YAML.safe_load(File.read(DBCONFIG))[ENV['RACK_ENV']]
      end
    end

    # Returns an instance of SQLite3::Database. If a database file doesn't
    # exist, create a new one.
    def initialize_database
      if File.exist? @filename
        SQLite3::Database.new @filename
      else
        setup_database
      end
    end

    # Creates a new database file and creates the widgets table in the database
    # file.
    def setup_database
      db = SQLite3::Database.new @filename
      db.execute DB_CREATE_TABLE_SQL
      db
    end

    # A naive SQL sanitization method
    def sanitize(str)
      str.gsub ';', ''
    end

    DBCONFIG = 'db.yml'.freeze
    DB_CREATE_TABLE_SQL =
      'create table widgets (name varchar(255), color varchar(255));'.freeze
    DB_SELECT_ALL_SQL = 'select * from widgets;'.freeze
    DB_INSERT_SQL = 'insert into widgets (name, color) values (?, ?)'.freeze
    DB_TRUNCATE_SQL = 'delete from widgets;'.freeze
  end
end
