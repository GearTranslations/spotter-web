# Spotter

## Introduction

Spotter webpage

## Dependencies

This project needs the following packages to run properly:

- Ruby 2.3.0 with [rbenv](https://github.com/rbenv/rbenv).

In staging and production, it also needs:
- [Nginx](https://www.nginx.com/).

## Setup

### Installation

Install the mentioned dependencies:

```sh
# Install Ruby and bundler with rbenv or rvm.
# ...
# Install system packages
sudo apt-get update
sudo apt-get install openjdk-8-jdk
```

Don't forget to setup the `JAVA_HOME` environment variable! Add to your `~/.bashrc`:

```sh
# Please, note that JAVA_HOME may be different depending on your OS and Java version
$ sudo echo export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/" >> /etc/environment
```


Or add to your `/etc/environment` file:

```sh
# Please, note that JAVA_HOME may be different depending on your OS and Java version
$ echo export JAVA_HOME="" >> ~/.bashrc
```

After installing all dependencies, download and install the project's gems with:

```
$ cd /path/to/spotter
$ bundle install
```

## Usage

To run this application, use ´rackup`:

```
bundle exec rackup
```

## Deploy

This application uses [capistrano](http://capistranorb.com/) to automate server deployment. To deploy
a new version of the application of a given branch, push the branch to the remote repository and
execute:

```sh
$ git checkout <branch>
$ git push origin <branch>
$ bundle exec cap <environment> deploy
# ...
> Please enter branch (<branch>):
# ...
```

To perform a deploy to any environment, you need to own the proper PEM ssh files, placed in
`~/.ssh` with permissions `600`; ask another developer for this keys.

For example, to deploy the `master` branch into the `production` environment, run:

```sh
$ git checkout master
$ git push origin master
$ bundle exec cap production deploy
# ...
> Please enter branch (master):
```

To list the current available _remote_ capistrano tasks, run:

```sh
$ bundle exec cap -T
```

Available capistrano environment are specified as configuration files in the `config/deploy/` folder
(`config/deploy/production.rb` and `config/deploy/staging.rb`).

## Tests

To run the tests locally, use the following commands:

```
$ bundle exec rubocop app.rb routes views config -R --format simple
```

## Authors

This project is currently maintained by [Laura Fariña](https://github.com/kiarapoke),
from [GearTranslations S.L.](http://www.geartranslations.com).

![GearTranslations logo](http://www.geartranslations.com/images/logogearsmall.png)
