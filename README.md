# icp-hub — Motoko package registry for icFrame
# Install: icp add pkg <name>

Official Motoko packages for Internet Computer apps.
Like `go get` — packages install to `backend/pkg/`.

## Install a package

```bash
icp add pkg slug
icp add pkg crud
icp a:p rbac          # short alias
```

## List packages

```bash
icp pkg:list          # available on hub
icp pkg:ls            # installed in project
```

## Publish a package

```bash
# 1. Create backend/pkg/mypkg/mypkg.mo
# 2. Push to hub
icp pkg:push mypkg
# 3. Add entry to index.json
# 4. git push
```

## Available packages

| Package | Import | Description |
|---|---|---|
| crud | `mo:pkg/crud/crud` | Map CRUD helpers |
| rbac | `mo:pkg/rbac/rbac` | Role-based access |
| errors | `mo:pkg/errors/result` | ApiResult types |
| caller | `mo:pkg/principal/caller` | Auth helpers |
| validate-text | `mo:pkg/validate/text` | Text validation |
| validate-nat | `mo:pkg/validate/nat` | Nat validation |
| pagination | `mo:pkg/pagination/pg` | Page helpers |
| time | `mo:pkg/time/now` | Timestamps |
| uuid | `mo:pkg/id/uuid` | ID generation |
| slug | `mo:pkg/slug/slug` | Text slugify |

## Contribute

1. Fork this repo
2. Add package under `packages/<name>/`
3. Add `icp.pkg.yaml` + `.mo` file(s)
4. Register in `index.json`
5. Open PR
