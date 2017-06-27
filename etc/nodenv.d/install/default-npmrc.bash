#!/usr/bin/env bash
if declare -Ff after_install >/dev/null; then
  after_install install_default_npmrc
else
  echo "nodenv: nodenv-default-npmrc plugin requires node-build" >&2
fi

install_default_npmrc() {
  # Only install default npmrc after successfully installing Node.
  [ "$STATUS" = "0" ] || return 0

  if [ -f "${NODENV_ROOT}/default-npmrc" ]; then
    cp "${NODENV_ROOT}/default-npmrc"
  fi
}
