# Registrator Documentation

This document describes how you can host your own instance of Registrator.

## Running the Registrator server

There are two parts. One is the GitHub comment listener and the other is the registrator process. The server is run with `Registrator.RegServer.server()` and registrator with `Registrator.RegServer.registrator()`. This can be run as a standalone server or as a docker container. See the `image` directory for instructions on how to build the docker image.

You can use `make` to control the components of registrator. The `Makefile` can be found in `image/scripts`. Commands:

1) `make startall`
2) `make startserver`
3) `make startregistrator`
4) `make stopall`
5) `make stopserver`
6) `make stopregistrator`
7) `make restartall`
8) `make restartserver`
9) `make restartregistrator`

## Config file

See `image/scripts/sample.toml` for description of entries in the config file.

## GitHub permissions and subscribed events for the app

You will need read-only permission for: Repository contents, Repository Metadata

You will need read permission for: Issues, Commit Statuses

You will need to subscribe to the following events: Issue comment and commit comment

## Private packages and registries

Do not install the public Registrator on your private packages and Registries. Please host your own Registrator for this.

If you do host your own Registrator, you can set it up on your private package:
* Set `disable_private_registrations` to `false` in the configuration.
* Add the GitHub user that you mention in the configuration file as a collaborator to the private Registry and package.
* Install the GitHub app on the repository.

## Allow private organization members to register

* Set `check_private_membership` to `true` in the configuration file
* Add the GitHub user that you mention in the configuration file as a member to the organization(s)

## The approved() call

The approved() call is a comment you make on a Registry PR. This is *disabled* on the public Registrator as it requires write access to the repository. It does the following:

1) If `register()` was called on a Pull request then that Pull request is merged.
2) A tag and release with the appropriate version is created on the package repository.
3) The Pull request on the Registry is merged.
4) If `register()` was called on an issue, that issue is closed.

Note that you need to install the Registrator app on the Registry for approval process to work.
