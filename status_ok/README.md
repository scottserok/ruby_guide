# Status? OK!

An elementary web application that is particular about it's status.  Send anything besides
an HTTP GET / request and it won't respond with "OK".  It should also respond
appropriately when the wrong HTTP method or path is requested.

## Instructions

Install the project dependencies with the `bundle install` command.

Run the tests with `rake test`. They will fail, they're supposed to fail.  Your job is to
fix the code in the `lib` directory so that the tests pass. Don't modify the test file in
order to make the tests pass.

Once you're able to get the tests to pass by modifying the code in the `lib` directory,
try adding another test in the `tests/status_ok_test.rb` or add a new feature to the
StatusOK web application.

## Usage

Open a terminal session and run the `rackup` command.  A web server (probably Puma) should
start up (probably on localhost:9292).

```
$ rackup
Puma starting in single mode...
* Version 3.12.0 (ruby 2.5.3-p105), codename: Llamas in Pajamas
* Min threads: 0, max threads: 16
* Environment: development
* Listening on tcp://localhost:9292
Use Ctrl-C to stop
::1 - - [05/Feb/2019:22:45:41 -0500] "GET / HTTP/1.1" 200 - 0.0008
::1 - - [05/Feb/2019:22:46:07 -0500] "GET /hello HTTP/1.1" 404 - 0.0006
::1 - - [05/Feb/2019:22:45:55 -0500] "POST / HTTP/1.1" 405 - 0.0005
```

Test the running web server from a separate terminal session or an internet browser.

```
$ curl localhost:9292/
OK
$ curl localhost:9292/hello
Not Found
$ curl -X POST localhost:9292/
```
