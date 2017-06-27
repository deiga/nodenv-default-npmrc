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
    mkdir -p "${NODENV_ROOT}/versions/${VERSION_NAME}/etc/"
    cp -RPp "${NODENV_ROOT}/default-npmrc" "${NODENV_ROOT}/versions/${VERSION_NAME}/etc/npmrc"
    echo "Installed npmrc $VERSION_NAME"
  fi
}
