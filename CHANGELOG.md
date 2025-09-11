## [0.1.3](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-bastion/compare/0.1.2...0.1.3) (2025-09-11)


### Bug Fixes

* add exclusion of shellcheck ([4889d62](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-bastion/commit/4889d62447277ab11ce0109b2a90572e93e59e59))
* disable grype seeing issues with megalinter ([80fcac2](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-bastion/commit/80fcac29962380f1330dafe06d6da196b6b2116e))
* ignore markdownlint 80 char line limit ([e94f285](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-bastion/commit/e94f285ec73392a135361c4d4272e5bd2a17a701))
* **chore:** lint fixes ([682d480](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-bastion/commit/682d4803c3800de67f65dc2678421094772b70b5))
* **chore:** lint fixes ([9c13e92](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-bastion/commit/9c13e92b7099d2df927fe0d0812407667b43e4fc))
* lint line ends fix ([4e5e16e](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-bastion/commit/4e5e16ec11489e625149923e2ddc92f4c5010054))
* **chore:** markdown lint headers fix ([c2f3629](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-bastion/commit/c2f36299d51c50c1c174cc450dd7f8010012ac6d))
* **lint:** prettier error for json format ([fb375d3](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-bastion/commit/fb375d3d432d828f77910be3072a69211d52b161))
* stop parallel running of megalinter workarounf gh [#4591](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-bastion/issues/4591) ([9493bb8](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-bastion/commit/9493bb811710bf092f10362ddb5442f9c4ebafa1))


### Features

* move to central gitlab-ci template repo ([e92b395](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-bastion/commit/e92b39534e1436b262552457973b9636f508c535))
* standardising mega-linter config for tf modules ([3615838](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-bastion/commit/36158387b0502b810faccdb79016a82170b39a85))

## [0.1.2](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-bastion/compare/0.1.1...0.1.2) (2025-01-25)


### Bug Fixes

* markdown lint fixes ([0c401ce](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-bastion/commit/0c401ce4e4079a10b0bc2afb7b8ebfdf01516f09))

## [0.1.1](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-bastion/compare/0.1.0...0.1.1) (2024-07-01)


### Bug Fixes

* [skip ci] automerge incorrectly grouped not merged ([816060d](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-bastion/commit/816060dd0a5478bbd3bc9b710557b5c762ed308e))
* **lint:** [skip ci] javascript fix using standard pre-commit ([13bc0d1](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-bastion/commit/13bc0d1d9ed2c0b062362f82edfcd9d16ce492d9))
* [skip ci] versioning done in pipeline ([c350d8e](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-bastion/commit/c350d8e84bb4e08790896796fcd2fa60d22760c7))
* add exclusion to megalinter ([fe92caf](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-bastion/commit/fe92caf21cd700cd57394b7c7cf0788d1385913e))
* allow longer commit length ([133932f](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-bastion/commit/133932f48f98ed7184152d9505eaa08103bd93bc))
* cleaning up tags ([9103e54](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-bastion/commit/9103e54756ff6a79df435bb938b87086585db6c0))
* remove deprecated arguement ([316c470](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-bastion/commit/316c470a527ab88176b8df129d95347972cebe76))
* set default value to be null ([509b45a](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-bastion/commit/509b45aeeda005807e9684abcfa9ed5a84ae59f0))
* spot_price variable ([3f96fc0](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-bastion/commit/3f96fc04c0be3829b28269f750850c16453c2466))


### Features

* enable auto-patching for minor and patches ([9ed6c3e](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-bastion/commit/9ed6c3ea36bccabbdb4d499caedf3aaa62b147fa))
* first commit of cicd config ([bfb217f](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-bastion/commit/bfb217f44f98fc7737faa3b2ae491106f9aa2d6e))
* make tags more generic ([da6cdff](https://gitlab.localrealm.net/automation/terraform/terraform-modules/terraform-module-aws-bastion/commit/da6cdff1f01b444decc6cc8d82b3f8a64c43b9ca))

# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.0.1] - 2019-07-11
### Added
- This CHANGELOG file

[Unreleased]: https://github.com/pcanham/terraform-module-aws-bastion/compare/v0.0.1...HEAD
[0.0.1]: https://github.com/pcanham/terraform-module-aws-bastion/releases/tag/v0.0.1
