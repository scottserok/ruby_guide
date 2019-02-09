# Git

> Version control is a system that records changes to a file or set of files
> over time so that you can recall specific versions later.


> Git is a free and open source distributed version control system designed to
> handle everything from small to very large projects with speed and efficiency.

[git-scm.com/doc](https://git-scm.com/doc)

[backlog.com/git-tutorial](https://backlog.com/git-tutorial/) is a great
resource to get started learning all about git.

## Install

To check if you already have git installed try the following:

```
$ git --version
```

If you already have it, skip down to the Usage section.

### Mac Homebrew

```
$ brew install git
```

### Download

Go to the [git-scm.com/downloads](https://git-scm.com/downloads) web page and
download the executable for your operating system.

## Usage

Git isn't something you'll learn overnight, but there are some commands that
you'll use more frequently than others.  This section is meant to give you the
essential commands to navigate your way around a project hosted on a remote git
server (like [Github](https://github.com) or [GitLab
SCM](https://about.gitlab.com/product/source-code-management/)).

### git clone

When you first encounter an existing project, you'll likely start by cloning the
project into your computer. This gives you a complete copy of the source and its
history of changes from the git server.

```
$ git clone https://github.com/scottserok/ruby_guide.git
```

The example command will download a copy of the source into a directory named
`ruby_guide`. You now have a complete clone of the the source and its history of
changes.

If your friend also has a clone of the source, then the following image depicts
the landscape of how the source code is distributed.

![distributed](https://git-scm.com/book/en/v2/images/distributed.png)

### git log

Now that you have a git project on your machine, you might want to see some of
the recent changes in its history.  Use the `git log` command to review the 10
most recent changes (10 is the default).

```
$ cd ruby_guide
$ git log
commit ca82a6dff817ec66f44342007202690a93763949
Author: Scott Chacon <schacon@gee-mail.com>
Date:   Mon Mar 17 21:52:11 2008 -0700

    changed the version number

commit 085bb3bcb608e1e8451d4b2432f8ecbe6306e7e7
Author: Scott Chacon <schacon@gee-mail.com>
Date:   Sat Mar 15 16:40:33 2008 -0700

    removed unnecessary test

commit a11bef06a3f659402fe7563abf99ad00de2209e6
Author: Scott Chacon <schacon@gee-mail.com>
Date:   Sat Mar 15 10:31:28 2008 -0700

    first commit
```

The output shows a list of `commits`, or changes, in the project's history.
Each commit has a unique SHA hash that identifies the change, who authored the
change, when the change was submitted, and a short message describing the
change. The git log, or commit log, is a useful tool to verify that you're
looking a the version of the source code that you expect. If you and a teammate
are experiencing different behavior in the same project, you might want to check
that you both have the same most recent commit in the commit log.

### git branch

A "branch" is a term you'll want to learn and use when you work with others on a
project that uses git.  With branches, everyone can work on their own changes to
the master source code files without clashing over changes to the same line of
code every time they save their work.

To view a list of branches in your local git project use the `git branch`
command.

```
$ cd ruby_guide
$ git branch
* master
  firetruck
```

The example output lists 2 branches: `* master`, and `firetruck`. The asterisks
before the branch indicates that this is the branch of code you're currently on.

You might clone a project and have to change into a specific branch of the code
to see what someone is working on. To change into a branch you use the
`git checkout` command.

```
$ cd ruby_guide
$ git checkout firetruck
$ git log
commit 804da34a4d801705760977707a0943866f443420
Author: Scott Serok <scott@serok.us>
Date    Tue Mar 18 12:32:08 2008 -0700

    added Firetruck model

commit ca82a6dff817ec66f44342007202690a93763949
Author: Scott Chacon <schacon@gee-mail.com>
Date:   Mon Mar 17 21:52:11 2008 -0700

    changed the version number

commit 085bb3bcb608e1e8451d4b2432f8ecbe6306e7e7
Author: Scott Chacon <schacon@gee-mail.com>
Date:   Sat Mar 15 16:40:33 2008 -0700

    removed unnecessary test

commit a11bef06a3f659402fe7563abf99ad00de2209e6
Author: Scott Chacon <schacon@gee-mail.com>
Date:   Sat Mar 15 10:31:28 2008 -0700

    first commit
```

In this example we changed into the branch called `firetruck` to access the
files in that version. We then displayed the commit log to see what, if
anything, is different about this branch from the master source.  We can see
there's an additional change to the project.

For a great explanation of branches, check out [backlog's
explanation](https://backlog.com/git-tutorial/using-branches/).

### git pull

You've cloned the source code and have checked out (`checkout`) different
branches of the code. It's possible that the source code on the remote git
server (Github, GitLab SCM, etc.) has been upated. There are several ways to
update your local clone of the source code, but one of the simplest ways is to
use `git pull` command.

```
$ cd ruby_guide
$ git branch
* master
  firetruck
$ git pull origin master
From github.com:scottserok/ruby_guide
 * branch            master     -> FETCH_HEAD
Already up-to-date.
```

`Already up-to-date.` means there were no changes to the local source code.
