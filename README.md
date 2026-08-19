# icp-hub — Motoko Package Registry

**62 packages** for Internet Computer / Motoko development.
Install like Go: `icp add pkg <name>`

Hub: https://github.com/prasangapokharel/icp-hub

## Quick start

```bash
icp p:list              # browse all packages
icp add pkg wallet      # install
icp a:p dao             # short alias
icp p:ls                # installed packages
```

## All packages

### Data & CRUD
| Package | Import | Description |
|---|---|---|
| crud | `mo:pkg/crud/crud` | Map CRUD helpers |
| pagination | `mo:pkg/pagination/pg` | Page helpers |
| storage | `mo:pkg/storage/storage` | Stable Map wrappers |
| cache | `mo:pkg/cache/cache` | TTL cache |
| search | `mo:pkg/search/search` | Text search |
| sort | `mo:pkg/sort/sort` | Sorting helpers |
| filter | `mo:pkg/filter/filter` | Collection filters |
| indexer | `mo:pkg/indexer/indexer` | Secondary indexes |
| migration | `mo:pkg/migration/migration` | Upgrade migrations |

### Auth & Access
| Package | Import | Description |
|---|---|---|
| rbac | `mo:pkg/rbac/rbac` | Role-based access |
| caller | `mo:pkg/principal/caller` | Principal auth |
| session | `mo:pkg/session/session` | Session tokens |
| rate-limit | `mo:pkg/rate-limit/limit` | Rate limiting |
| multisig | `mo:pkg/multisig/multisig` | Multi-approver |
| whitelist | `mo:pkg/whitelist/whitelist` | Allow lists |
| api-key | `mo:pkg/api-key/apikey` | API keys |

### Errors
| Package | Import | Description |
|---|---|---|
| errors | `mo:pkg/errors/result` | ApiResult types |
| retry | `mo:pkg/retry/retry` | Retry with backoff |
| circuit-breaker | `mo:pkg/circuit-breaker/breaker` | Failure isolation |

### Validation
| Package | Import | Description |
|---|---|---|
| validate-text | `mo:pkg/validate/text` | Text validation |
| validate-nat | `mo:pkg/validate/nat` | Nat validation |
| validate-email | `mo:pkg/validate/email` | Email validation |
| validate-url | `mo:pkg/validate/url` | URL validation |
| validate-json | `mo:pkg/validate/json` | JSON validation |
| validate-principal | `mo:pkg/validate/principal` | Principal checks |
| sanitize | `mo:pkg/sanitize/sanitize` | Input sanitization |

### IDs & Time
| Package | Import | Description |
|---|---|---|
| time | `mo:pkg/time/now` | Timestamps |
| uuid | `mo:pkg/id/uuid` | ID generation |
| slug | `mo:pkg/slug/slug` | Text slugify |
| nanoid | `mo:pkg/nanoid/nanoid` | Short IDs |
| date | `mo:pkg/date/date` | Date helpers |
| cron | `mo:pkg/cron/cron` | Scheduled tasks |

### Tokens & Payments
| Package | Import | Description |
|---|---|---|
| icrc1 | `mo:pkg/icrc1/icrc1` | ICRC-1 helpers |
| icrc2 | `mo:pkg/icrc2/icrc2` | ICRC-2 helpers |
| ledger | `mo:pkg/ledger/ledger` | ICP ledger |
| escrow | `mo:pkg/escrow/escrow` | Escrow pattern |
| wallet | `mo:pkg/wallet/wallet` | Balance tracking |
| nft | `mo:pkg/nft/nft` | NFT helpers |

### HTTP & Inter-canister
| Package | Import | Description |
|---|---|---|
| http | `mo:pkg/http/http` | HTTP outcall types |
| canister-call | `mo:pkg/canister-call/call` | Inter-canister calls |
| webhook | `mo:pkg/webhook/webhook` | Event dispatch |

### Serialization
| Package | Import | Description |
|---|---|---|
| json | `mo:pkg/json/json` | JSON helpers |
| csv | `mo:pkg/csv/csv` | CSV helpers |
| base64 | `mo:pkg/base64/base64` | Hex encoding |
| candid-utils | `mo:pkg/candid-utils/utils` | Candid helpers |

### Utilities
| Package | Import | Description |
|---|---|---|
| array | `mo:pkg/array/array` | Array utils |
| list | `mo:pkg/list/list` | List utils |
| math | `mo:pkg/math/math` | Math helpers |
| string | `mo:pkg/string/string` | String utils |
| random | `mo:pkg/random/random` | Random helpers |
| logger | `mo:pkg/logger/logger` | Structured logging |
| env | `mo:pkg/env/env` | Config pattern |
| feature-flag | `mo:pkg/feature-flag/flag` | Feature toggles |

### Storage & Files
| Package | Import | Description |
|---|---|---|
| asset | `mo:pkg/asset/asset` | Asset helpers |
| blob | `mo:pkg/blob/blob` | Blob chunking |
| upload | `mo:pkg/upload/upload` | Upload pattern |

### Testing & Governance
| Package | Import | Description |
|---|---|---|
| test | `mo:pkg/test/test` | Test assertions |
| mock | `mo:pkg/mock/mock` | Mock data |
| seed | `mo:pkg/seed/seed` | DB seeding |
| dao | `mo:pkg/dao/dao` | Voting pattern |
| upgrade | `mo:pkg/upgrade/upgrade` | Upgrade hooks |
| cycles | `mo:pkg/cycles/cycles` | Cycles monitoring |

## Contribute

1. Fork this repo
2. Add `packages/<name>/<name>.mo` + `icp.pkg.yaml`
3. Register in `index.json`
4. Open PR
