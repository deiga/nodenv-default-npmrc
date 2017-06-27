#!/usr/bin/env bats

load test_helper

export INSTALL_HOOK="${BATS_TEST_DIRNAME}/../etc/nodenv.d/install/default-npmrc.bash"
@test "running nodenv-install auto installs npmrc" {
  touch "${NODENV_ROOT}/default-npmrc"
  stub nodenv-prefix '0.10.36 : echo "$NODENV_ROOT/versions/0.10.36"'
  run nodenv-install 0.10.36

  assert_success
  assert_line 'Installed fake version 0.10.36'
  assert_line 'Installed npmrc 0.10.36'
  assert_npmrc 0.10.36
}

@test "a failed nodenv-install exits gracefully" {
  run nodenv-install fail 0.10.36

  assert_failure
  assert_line 'Failed installation of 0.10.36'
  refute_line 'Installed npmrc 0.10.36'
  refute_npmrc 0.10.36
}
