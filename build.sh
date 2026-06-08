#!/bin/bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  ./build.sh <version>

Examples:
  ./build.sh 1.2.3
EOF
}

if [[ $# -ne 1 ]]; then
  usage >&2
  exit 1
fi

VERSION="$1"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! [[ "${VERSION}" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Invalid version format: ${VERSION}" >&2
  echo "Expected format: x.y.z" >&2
  exit 1
fi

shopt -s nullglob
gemspecs=("${SCRIPT_DIR}"/*.gemspec)
shopt -u nullglob

if [[ "${#gemspecs[@]}" -ne 1 ]]; then
  echo "Expected exactly one gemspec in ${SCRIPT_DIR}" >&2
  exit 1
fi

GEMSPEC_BASENAME="$(basename "${gemspecs[0]}")"
GEM_NAME="$(basename "${GEMSPEC_BASENAME}" .gemspec)"
GEMSPEC="${SCRIPT_DIR}/${GEMSPEC_BASENAME}"
OUTPUT_GEM="${SCRIPT_DIR}/${GEM_NAME}-${VERSION}.gem"

if [[ ! -f "${GEMSPEC}" ]]; then
  echo "Expected gemspec not found: ${GEMSPEC}" >&2
  exit 1
fi

sed -i.bak -E "s/(spec\.version\s*=\s*['\"])[^'\"]+(['\"])/\1${VERSION}\2/" "${GEMSPEC}"
rm -f "${GEMSPEC}.bak"

rm -f "${OUTPUT_GEM}"

(
  cd "${SCRIPT_DIR}"
  gem build "${GEMSPEC_BASENAME}"
)

if [[ ! -f "${OUTPUT_GEM}" ]]; then
  echo "Expected output gem not found: ${OUTPUT_GEM}" >&2
  exit 1
fi

echo "${OUTPUT_GEM}"
