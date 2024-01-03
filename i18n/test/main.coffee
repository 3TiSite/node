#!/usr/bin/env coffee

> @3-/i18n
  @3-/uridir
  path > join

ROOT = uridir(import.meta)

await i18n(
  join ROOT,'i18n'
  'en'
)

