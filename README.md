# quickstart-nextjs-project-scripts

scripts to help you pre-configure your nextjs project

| Script | Settings |
| ------ | -------- |
| 0100-create.sh   | Create Next App |
| 0110-init.sh     | Telemetry & Husky |
| 0120-configs.sh  | Editorconfig |
| 0130-prettier.sh | Prettier (Tailwind & Organize Imports) |
| 0140-eslint.sh   | Eslint (TypeScript & Prettier) |
| 0200-cleanup.sh  | General cleanup and formatting |

default settings

- pnpm
- typescript (yes)
- eslint (yes)
- tailwind (yes)
- src directory (no)
- app router (yes)

pnpm scripts

```
"dev":        "next dev",
"build":      "next build",
"start":      "next start",
"lint":       "next lint",
"prepare":    "next telemetry disable && husky install",
"format":     "prettier --check .",
"format:fix": "prettier --write ."
```
