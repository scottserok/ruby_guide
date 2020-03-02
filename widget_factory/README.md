# Widget Factory

A web application that can make widgets. This app is an introduction to the
Sinatra web framework and SQLite3 database engine.

## Instructions

Install the project dependencies with the `bundle install` command.

Run the tests with `rake test`. They will fail, they're supposed to fail.  Your job is to
fix the code in the `lib` directory so that the tests pass. Don't modify the test file in
order to make the tests pass.

Once you're able to get the tests to pass by modifying the code in the `lib` directory,
try adding another test in the `tests/widget_factory_test.rb` file.

## Usage

Open up a terminal session and start the Sinatra application just like you started the
Status OK application.  They are both apps built on the Rack web framework. Sinatra has
some additional features built on top for developer's convenience.

```
$ rackup
Puma starting in single mode...
* Version 3.12.0 (ruby 2.5.3-p105), codename: Llamas in Pajamas
* Min threads: 0, max threads: 16
* Environment: development
* Listening on tcp://localhost:9292
Use Ctrl-C to stop
```

Then open up your web browser and navigate to `localhost:9292` to see the home
page (`/` path). Check the same terminal session that the application was
started in to find the logs created for that request.

```
Puma starting in single mode...
* Version 3.12.0 (ruby 2.5.3-p105), codename: Llamas in Pajamas
* Min threads: 0, max threads: 16
* Environment: development
* Listening on tcp://localhost:9292
Use Ctrl-C to stop
D, [2019-02-07T23:57:23.599525 #86467] DEBUG -- GET: params={}
::1 - - [07/Feb/2019:23:57:23 -0500] "GET / HTTP/1.1" 200 5 0.0218
```

Change the LOG\_LEVEL variable before the `rackup` command to silence debug
logs.

```
$ LOG_LEVEL=1 rackup
```

## Appendix

### Sinatra

[Sinatra](http://sinatrarb.com/) is a DSL for quickly creating web applications
in Ruby with minimal effort.

### SQLite

[SQLite](https://www.sqlite.org/index.html) is a small, fast, self-contained,
high-reliability, full-featured, SQL database engine. SQLite reads and writes
directly to ordinary disk files unlike most other SQL databases. Check out the
full list of SQL features [on their website](https://www.sqlite.org/fullsql.html).
