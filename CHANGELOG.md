# Changelog

## v0.3.3

- Update vue.js app installation.
- Fix Django environment for Sphinx manual building.
- Fix environment issues.

## v0.3.2

- Fix problem with unset SENTRY_DSN.

## v0.3.1

- Fixing log generation with gunicorn.

## v0.3.0

- Force-disabling sentry integration.
- Using `git describe --tags`.

## v0.2.0

- Adding support for registering of sentry releases.
- Bugfix staticfiles.

## v0.1.14

- Adding support for custom JS/CSS includes and disabling CDN includes.

## v0.1.13

- Adding `sodar_core_app_conn_max_age`.

## v0.1.12

- Fixing another issue with virtualenv.

## v0.1.11

- Fixing issue with virtualenv installation.

## v0.1.10

- Installation of dependency git.

## v0.1.9

- Making work when running via sudo.

## v0.1.8

- Adjusting blockinfile marker for `~/.bashrc`.

## v0.1.7

- Properly creating checkout directory and git clone.

## v0.1.6

- Fixing queues configuration.

## v0.1.5

- Various smaller updates to configuration.

## v0.1.4

- Adding make package.
- Support for installing embedded Vue.js apps.

## v0.1.3

- Making web worker coutn configurable.
- Making celery worker count configurable.

## v0.1.2

- Adding sasl dependency.
- Fixing systemd jobs.
- Making "nogroup" name platform dependent.
- Fixing super user creation.
- Making `no_log` configurable.
- Cleanup of virtualenv if installation fails.
- Various fixes to playbooks and templates.
- Works for deploying `bihealth.digestiflow_server` in CI now.
- Fixing role name.
- More idempotency.

## v0.1.0

Initial release.

- Everything is new!
