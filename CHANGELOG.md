# Changelog

## [4.2.0](https://github.com/camptocamp/devops-stack-module-cluster-eks/compare/v4.1.0...v4.2.0) (2024-10-10)


### Features

* add variable to add other principals to access the cluster ([d10dde9](https://github.com/camptocamp/devops-stack-module-cluster-eks/commit/d10dde957c29a49c89b3961457dd97a562a5f621))


### Bug Fixes

* enable administrator access to the cluster creator ([bd42ad6](https://github.com/camptocamp/devops-stack-module-cluster-eks/commit/bd42ad60187f34457db4cb32203beb43064eade8))

## [4.1.0](https://github.com/camptocamp/devops-stack-module-cluster-eks/compare/v4.0.0...v4.1.0) (2024-09-19)


### Features

* add cluster_enabled_log_types variable ([13803cb](https://github.com/camptocamp/devops-stack-module-cluster-eks/commit/13803cb96f12e45df98aa156befb071fffc002dc))

## [4.0.0](https://github.com/camptocamp/devops-stack-module-cluster-eks/compare/v3.3.0...v4.0.0) (2024-09-05)


### ⚠ BREAKING CHANGES

* remove deprecated parameters

### Features

* add variable to put tags on resources ([7d4164f](https://github.com/camptocamp/devops-stack-module-cluster-eks/commit/7d4164f7c116782a69b1faa318e7300d56e45dc9))
* update eks module ([4b7c11e](https://github.com/camptocamp/devops-stack-module-cluster-eks/commit/4b7c11ee6a82ddcac106ef0ca328a2d685721048))


### Bug Fixes

* remove deprecated parameters ([dc2eff9](https://github.com/camptocamp/devops-stack-module-cluster-eks/commit/dc2eff942192ad926ad8b8e05eb29f3e2646e5ac))

## [3.3.0](https://github.com/camptocamp/devops-stack-module-cluster-eks/compare/v3.2.0...v3.3.0) (2024-08-27)


### Features

* add outputs nlb dns ([#29](https://github.com/camptocamp/devops-stack-module-cluster-eks/issues/29)) ([c64b795](https://github.com/camptocamp/devops-stack-module-cluster-eks/commit/c64b795c6379ea46bb0d43fa3397825c9d8a9657))

## [3.2.0](https://github.com/camptocamp/devops-stack-module-cluster-eks/compare/v3.1.0...v3.2.0) (2024-05-30)


### Features

* add cluster ARN as output ([#26](https://github.com/camptocamp/devops-stack-module-cluster-eks/issues/26)) ([ac23208](https://github.com/camptocamp/devops-stack-module-cluster-eks/commit/ac2320890483534e87a5d4bb2ac7b70ae3343f43))

## [3.1.0](https://github.com/camptocamp/devops-stack-module-cluster-eks/compare/v3.0.1...v3.1.0) (2024-02-23)


### Features

* add a subdomain variable ([#23](https://github.com/camptocamp/devops-stack-module-cluster-eks/issues/23)) ([fb98345](https://github.com/camptocamp/devops-stack-module-cluster-eks/commit/fb98345f4126349948718dd07a8f04f0bcb761d1))


### Bug Fixes

* node_groups output value ([#24](https://github.com/camptocamp/devops-stack-module-cluster-eks/issues/24)) ([4b4228b](https://github.com/camptocamp/devops-stack-module-cluster-eks/commit/4b4228b20742ec3672c502909050bc1bba9cba49))

## [3.0.1](https://github.com/camptocamp/devops-stack-module-cluster-eks/compare/v3.0.0...v3.0.1) (2023-11-02)


### Bug Fixes

* tf error when create_public_nlb is false ([#21](https://github.com/camptocamp/devops-stack-module-cluster-eks/issues/21)) ([5568923](https://github.com/camptocamp/devops-stack-module-cluster-eks/commit/5568923c88de59dbbb2d71e5a8a9bda214651137))

## [3.0.0](https://github.com/camptocamp/devops-stack-module-cluster-eks/compare/v2.0.2...v3.0.0) (2023-08-21)


### ⚠ BREAKING CHANGES

* switch to EKS managed node groups by default ([#17](https://github.com/camptocamp/devops-stack-module-cluster-eks/issues/17))

### Features

* rely on `aws_eks_cluster` resource `version` default ([#20](https://github.com/camptocamp/devops-stack-module-cluster-eks/issues/20)) ([65dd9ec](https://github.com/camptocamp/devops-stack-module-cluster-eks/commit/65dd9ec192606ff03c11bd6f79f91253250e8987))
* switch to EKS managed node groups by default ([#17](https://github.com/camptocamp/devops-stack-module-cluster-eks/issues/17)) ([1f81e38](https://github.com/camptocamp/devops-stack-module-cluster-eks/commit/1f81e38397fce3957deedbc0dfe152737537393a))


### Bug Fixes

* autoscaling groups to NLBs attachment ([#19](https://github.com/camptocamp/devops-stack-module-cluster-eks/issues/19)) ([2c02776](https://github.com/camptocamp/devops-stack-module-cluster-eks/commit/2c0277614adc9407f9e9cc28f9b53964183f18e7))

## [2.0.2](https://github.com/camptocamp/devops-stack-module-cluster-eks/compare/v2.0.1...v2.0.2) (2023-07-11)


### Documentation

* fix a few typos ([#15](https://github.com/camptocamp/devops-stack-module-cluster-eks/issues/15)) ([2dac66f](https://github.com/camptocamp/devops-stack-module-cluster-eks/commit/2dac66f20633fe89424d9e5604deaadc90540a1b))

## [2.0.1](https://github.com/camptocamp/devops-stack-module-cluster-eks/compare/v2.0.0...v2.0.1) (2023-05-26)


### Bug Fixes

* wrong target group attached to private load balancer on port 80 ([#12](https://github.com/camptocamp/devops-stack-module-cluster-eks/issues/12)) ([81cbaee](https://github.com/camptocamp/devops-stack-module-cluster-eks/commit/81cbaee16160c027f72cae76788776797bc19b14))

## [2.0.0](https://github.com/camptocamp/devops-stack-module-cluster-eks/compare/v1.0.0...v2.0.0) (2023-04-25)


### ⚠ BREAKING CHANGES

* remove untested cluster-autoscaler support ([#9](https://github.com/camptocamp/devops-stack-module-cluster-eks/issues/9))

### Features

* remove untested cluster-autoscaler support ([#9](https://github.com/camptocamp/devops-stack-module-cluster-eks/issues/9)) ([3565a7b](https://github.com/camptocamp/devops-stack-module-cluster-eks/commit/3565a7b919284487c64899bc687fd58dba003f98))

## [1.0.0](https://github.com/camptocamp/devops-stack-module-cluster-eks/compare/v1.0.0-alpha.2...v1.0.0) (2023-03-24)


### Documentation

* correct module title and add PR template ([#6](https://github.com/camptocamp/devops-stack-module-cluster-eks/issues/6)) ([13eff88](https://github.com/camptocamp/devops-stack-module-cluster-eks/commit/13eff8865dd720be595c41afed6f88aad19f874a))

## [1.0.0-alpha.2](https://github.com/camptocamp/devops-stack-module-cluster-eks/compare/v1.0.0...v1.0.0-alpha.2) (2023-03-10)


### Features

* initial commit (migration from the main repo) ([b6b0a3a](https://github.com/camptocamp/devops-stack-module-cluster-eks/commit/b6b0a3aab02dfe2ea07b505d3f50dcad877f21e4))
* upgrade modules and Terraform providers ([#3](https://github.com/camptocamp/devops-stack-module-cluster-eks/issues/3)) ([200a6c3](https://github.com/camptocamp/devops-stack-module-cluster-eks/commit/200a6c32da9de6e627d13e82f3a3c2897ef17d55))

## 1.0.0-alpha.1 (2022-12-13)


### Features

* initial commit (migration from the main repo) ([b6b0a3a](https://github.com/camptocamp/devops-stack-module-cluster-eks/commit/b6b0a3aab02dfe2ea07b505d3f50dcad877f21e4))
