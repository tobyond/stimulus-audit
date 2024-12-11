# Changelog
All notable changes to this project will be documented in this file.

## [0.2.0] - 2024-03-11
### Changed
- Renamed rake tasks to avoid conflicts with stimulus-rails
- stimulus:audit is now audit:stimulus
- stimulus:scan is now audit:scan

### Fixed
- Fixed gem auto-loading in Rails applications

## [0.1.1] - 2024-03-11
### Fixed
- Fixed controller name handling to support underscore to hyphen conversion
- Added proper Rails integration via Railtie
- Cleaned up gem dependencies

## [0.1.0] - 2024-03-11
### Added
- Initial release
- Basic controller scanning functionality
- Controller usage audit capabilities
- Support for namespaced controllers
