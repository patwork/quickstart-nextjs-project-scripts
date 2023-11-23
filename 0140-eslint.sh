#!/bin/bash

. "$(dirname -- "$0")/0000.sh" go

# install
pnpm install -D @typescript-eslint/parser@latest @typescript-eslint/eslint-plugin@latest eslint-config-prettier@latest

# config
echo '{
  "root": true,
  "parser": "@typescript-eslint/parser",
  "plugins": ["@typescript-eslint"],
  "extends": [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended",
    "next/core-web-vitals",
    "prettier"
  ]
}' > .eslintrc.json

# Commit
commit_all_changes "Quickstart: Eslint (TypeScript & Prettier)"

