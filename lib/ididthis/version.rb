require "git-version-bump"

module Ididthis
  VERSION = GVB.version
  MAJOR_VERSION = GVB.major_version
  MINOR_VERSION = GVB.minor_version
  PATCH_VERSION = GVB.patch_version
  INTERNAL_REVISION = GVB.internal_revision
  DATE = GVB.date
end
