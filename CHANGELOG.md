# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.1.1] - 2021-06-20
### Fixed
- disable passwords in `/etc/shadow` instead of assigning empty passwords
  (redundant due to `PasswordAuthentication no` in `sshd_config`)

## [0.1.0] - 2019-06-14

[Unreleased]: https://github.com/fphammerle/docker-ssh-bastion/compare/0.1.1...HEAD
[0.1.1]: https://github.com/fphammerle/docker-ssh-bastion/compare/0.1.0...0.1.1
[0.1.0]: https://github.com/fphammerle/docker-ssh-bastion/tree/0.1.0
