# Hello World

The smallest project in the collection. The file `lib/hello_world` defines a method that
returns a string `"Hello, world!"`. This project introduces an easy project structure
template with external dependencies and tests. The goal for you is to run the tests
successfully.

```
$ rake test
Run options: --seed 38765

# Running:

.

Finished in 0.001440s, 694.4444 runs/s, 694.4444 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```

## Installation

Ruby projects will usually include a file in the root directory named `Gemfile`. This is
where any external dependencies are defined using the `gem "library_name"` syntax.

To install these dependencies for the project to have access run the `bundle install`
command from the terminal.

```
$ cd hello_world
$ bundle install
```

This may take a few seconds or several minutes depending on the number of depdendencies in
the Gemfile.

Many projects will install and use the `rake` library to run tasks.  We use it to run the
test suite on the command line thanks to the command line program installed with the
`rake` library.

```
$ cd hello_world
$ rake test
```

Ask `rake` what tasks are available for you to run.

```
$ cd hello_world
$ rake --tasks
rake default  # Run tests
rake test     # Run tests
```

Rake tasks will be defined in the project's `Rakefile` at the root of the project
directory.
