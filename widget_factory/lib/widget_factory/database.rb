# frozen_string_literal: true

# The WidgetFactory module to group our class definitions by topic
module WidgetFactory
  # The Database class is responsible for connecting to the widgets database and
  # sending SQL commands to the widgets database.
  class Database
    include Singleton

    def initialize
      @filename = config['filename']
      raise NoFilenameError.new if @filename.nil?
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
        raise NoEnvironmentError.new if ENV['RACK_ENV'].nil?
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

    def sanitize(str)
      CGI.escape_html(str)
    end

    DBCONFIG = 'db.yml'.freeze
    DB_CREATE_TABLE_SQL =
      'create table widgets (name varchar(255), color varchar(255));'.freeze
    DB_SELECT_ALL_SQL = 'select * from widgets;'.freeze
    DB_INSERT_SQL = 'insert into widgets (name, color) values (?, ?)'.freeze
    DB_TRUNCATE_SQL = 'delete from widgets;'.freeze
  end

  # NoFilenameError
  # Raised when sqlite database filename is nil
  class NoFilenameError < StandardError
    def initialize
      super 'Database filename not found. Check the db.yml file contents.'
    end
  end

  # NoEnvironmentError
  # Raised when RACK_ENV is incorrect
  class NoEnvironmentError < StandardError
    def initialize
      super 'RACK_ENV must be set to one of development, test, or production.'
    end
  end
end
