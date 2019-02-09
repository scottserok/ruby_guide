# Homebrew

> The missing package manager for macOS (Linux)

## Installation

Open a terminal and paste the following command.

```
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## Usage

Use the `brew` command to install, update, and remove packages from your OS.

### brew install

```
$ brew install redis
```

For a complete list of packages, see [the formulae.brew.sh web
page](https://formulae.brew.sh/).

### brew services

Some packages like `redis` and `postgres` come with server executables that can
be managed by brew.  To start a server like `redis` use the `brew services run`
command.

```
$ brew services run redis
```

Use the `brew services` command to list services and their status that brew can
help you manage.

```
$ brew services
Name           Status  User       Plist
redis          started scottserok /Users/scottserok/Library/LaunchAgents/homebrew.mxcl.redis.plist
```

If you know the [Redis](https://redis.io/commands) protocol, you can connect to
the local Redis server that you started with the `brew services run` command and
send it commands.

```
$ redis-cli
127.0.0.1:6379> KEYS *
(empty list or set)
127.0.0.1:6379> EXIT
```
