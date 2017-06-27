#!/usr/bin/env bats

load test_helper

@test "installs nodenv-default-npmrc into PREFIX" {
  cd "$BATS_TMPDIR"
  PREFIX="${PWD}/usr" run "${BATS_TEST_DIRNAME}/../install.sh"
  assert_success ""

  cd usr

  assert [ -x etc/nodenv.d/install/default-npmrc.bash ]
}

@test "overwrites old installation" {
  cd "$BATS_TMPDIR"
  mkdir -p etc/nodenv.d/install
  touch etc/nodenv.d/install/default-npmrc.bash

  PREFIX="$PWD" run "${BATS_TEST_DIRNAME}/../install.sh"
  assert_success ""

  assert [ -x etc/nodenv.d/install/default-npmrc.bash ]
  run grep "install_default_npmrc" etc/nodenv.d/install/default-npmrc.bash
  assert_success
}
