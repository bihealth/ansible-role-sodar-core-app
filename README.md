[![Build Status](https://travis-ci.org/bihealth/ansible-role-sodar-core-app.svg?branch=master)](https://travis-ci.org/bihealth/ansible-role-sodar-core-app)

# SODAR Core App Role Base

An "abstract base role" for SODAR Core Apps.

## Requirements

A PostgreSQL server has to be setup independently.

## Role Variables

See `defaults/main.yml` for all role variables and their documentation.

## Dependencies

- `bihealth.docker` (if `sodar_core_app_docker_enabled`)TODO
- `bihealth.redis`
- `bihealth.memcached`
- `bihealth.nginx`
- `bihealth.python3`
- `bihealth.postgres_client`

## Example Playbook

See any of the roles depending on this.

## Open Issues

- Possibly remove dependency on `bihealth.memcached`.

## License

MIT

## Author Information

- Manuel Holtgrewe

Created with love at [Core Unit Bioinformatics (CUBI), Berlin Institute of Health (BIH)](https://www.cubi.bihealth.org).
