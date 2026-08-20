# icp-hub — Motoko Package Registry

**92 packages** for Internet Computer / Motoko development.
Install like Go: `falcon add pkg <name>`

Hub: https://github.com/prasangapokharel/icp-hub

> **Note:** `hub/` is its own Git repo. The main IcFalcon project gitignores this folder.
> Clone the hub separately: `git clone https://github.com/prasangapokharel/icp-hub.git`

---

## Quick start (install)

```bash
falcon p:list              # browse all packages
falcon add pkg wallet      # install to backend/pkg/
falcon a:p dao             # short alias
falcon p:ls                # installed in your project
```

---

## Create & publish a package

### Step 1 — Write the Motoko module

Create your package locally in any IcFalcon project:

```
backend/pkg/mypkg/mypkg.mo
```

```motoko
import Text "mo:core/Text";

module {
  public func greet(name : Text) : Text {
    "Hello, " # name;
  };
};
```

Rules:
- One `module { }` per file
- Use `mo:core/*` imports (not `mo:base`)
- Keep files under 300 lines
- No business logic — pure helpers only
- Test with `falcon b:test --local` after adding

### Step 2 — Create the manifest

In the same folder, add `icp.pkg.yaml`:

```yaml
name: mypkg
version: 1.0.0
description: One-line description of what it does
maintainer: your-github-username
install: pkg/mypkg
files:
  - mypkg.mo
```

| Field | Meaning |
|---|---|
| `name` | Package name (kebab-case, matches folder in hub) |
| `version` | Semver (`1.0.0`) |
| `install` | Where it installs in `backend/pkg/` |
| `files` | `.mo` files to copy |

### Step 3 — Push to hub (maintainers)

```bash
# from IcFalcon project root
falcon p:push mypkg
```

This copies `backend/pkg/mypkg/` into `hub/packages/mypkg/`.

### Step 4 — Register in index.json

Open `hub/index.json` and add:

```json
"mypkg": {
  "version": "1.0.0",
  "description": "One-line description",
  "path": "packages/mypkg",
  "import": "mo:pkg/mypkg/mypkg"
}
```

### Step 5 — Commit and push hub

```bash
cd hub
git add packages/mypkg/ index.json
git commit -m "add pkg: mypkg"
git push origin main
```

Users can install within minutes:

```bash
falcon add pkg mypkg
```

---

## Contribute via PR (external contributors)

```bash
# 1. Fork github.com/prasangapokharel/icp-hub
git clone https://github.com/YOUR_USER/icp-hub.git
cd icp-hub

# 2. Create package
mkdir -p packages/mypkg
# add mypkg.mo + icp.pkg.yaml (see Step 1 & 2 above)

# 3. Register in index.json

# 4. Push and open PR
git checkout -b add-mypkg
git add packages/mypkg/ index.json
git commit -m "add pkg: mypkg"
git push origin add-mypkg
# Open PR on GitHub
```

PR checklist:
- [ ] `mypkg.mo` compiles with `mo:core` (moc 1.6+)
- [ ] `icp.pkg.yaml` present with all fields
- [ ] Entry added to `index.json`
- [ ] No duplicate package name
- [ ] File under 300 lines
- [ ] Description is clear

---

## Hub folder & gitignore

The `hub/` folder inside IcFalcon is **gitignored** in the main project because:

| Reason | Detail |
|---|---|
| Separate repo | Hub lives at `github.com/prasangapokharel/icp-hub` |
| No nested git | Avoids submodule conflicts in IcFalcon |
| Clean clone | `git clone IcFalcon` stays small |
| Hub devs work in hub repo | `git clone icp-hub` separately |

**IcFalcon `.gitignore`:**
```
hub/
```

**To work on the hub:**
```bash
git clone https://github.com/prasangapokharel/icp-hub.git
cd icp-hub
# edit packages, index.json, push
```

**To sync hub into IcFalcon locally** (optional, for maintainers):
```bash
git clone https://github.com/prasangapokharel/icp-hub.git hub
```

---

## Package structure reference

```
icp-hub/
├── index.json              # registry — all packages listed here
├── README.md               # this file
└── packages/
    └── mypkg/
        ├── icp.pkg.yaml    # manifest
        └── mypkg.mo        # Motoko module
```

After install in a project:

```
backend/
├── pkg/
│   └── mypkg/
│       └── mypkg.mo        # installed by falcon add pkg mypkg
└── icp.pkg                 # lock file (committed in project)
```

Import in your canister:

```motoko
import Mypkg "mo:pkg/mypkg/mypkg";
```

---

## Version bumps

To release a new version:

1. Update `version` in `icp.pkg.yaml`
2. Update `version` in `index.json`
3. Commit: `git commit -m "bump mypkg to 1.1.0"`
4. Push: `git push origin main`

Users reinstall with:
```bash
falcon add pkg mypkg
```

---

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
| object-storage | `mo:pkg/object-storage/object-storage` | ExternalBlob refs and file meta |
| ipfs | `mo:pkg/ipfs/ipfs` | IPFS CID and gateway URLs |
| image-meta | `mo:pkg/image-meta/image-meta` | MIME sniff and size limits |

### Email
| Package | Import | Description |
|---|---|---|
| email | `mo:pkg/email/email` | Transactional email types |
| email-verify | `mo:pkg/email-verify/email-verify` | Verification tokens and links |
| email-template | `mo:pkg/email-template/email-template` | Placeholder render and HTML escape |
| sendgrid | `mo:pkg/sendgrid/sendgrid` | SendGrid API payloads |
| resend | `mo:pkg/resend/resend` | Resend API payloads |

### AI / LLM
| Package | Import | Description |
|---|---|---|
| openai | `mo:pkg/openai/openai` | OpenAI chat and embeddings config |
| anthropic | `mo:pkg/anthropic/anthropic` | Claude API config |
| gemini | `mo:pkg/gemini/gemini` | Google Gemini API helpers |
| embeddings | `mo:pkg/embeddings/embeddings` | Vector similarity |
| llm-router | `mo:pkg/llm-router/llm-router` | Provider enum and token estimate |

### Payments
| Package | Import | Description |
|---|---|---|
| stripe | `mo:pkg/stripe/stripe` | Stripe checkout types |
| paypal | `mo:pkg/paypal/paypal` | PayPal order types |
| invoice | `mo:pkg/invoice/invoice` | Invoice totals |
| subscription | `mo:pkg/subscription/subscription` | Plan renewal helpers |

### Connectors
| Package | Import | Description |
|---|---|---|
| slack | `mo:pkg/slack/slack` | Slack post message |
| discord | `mo:pkg/discord/discord` | Discord webhooks |
| telegram | `mo:pkg/telegram/telegram` | Telegram bot API |
| x-post | `mo:pkg/x-post/x-post` | X tweet posting |
| whatsapp | `mo:pkg/whatsapp/whatsapp` | WhatsApp templates |
| google-oauth | `mo:pkg/google-oauth/google-oauth` | Google OAuth2 PKCE |
| google-mail | `mo:pkg/google-mail/google-mail` | Gmail API helpers |
| google-calendar | `mo:pkg/google-calendar/google-calendar` | Calendar API helpers |

### HTTP & Security
| Package | Import | Description |
|---|---|---|
| http-outcall | `mo:pkg/http-outcall/http-outcall` | Outcall request types and limits |
| webhook-verify | `mo:pkg/webhook-verify/webhook-verify` | Signature verification |
| oauth2 | `mo:pkg/oauth2/oauth2` | Generic OAuth2 helpers |

### ICP Native
| Package | Import | Description |
|---|---|---|
| vetkeys | `mo:pkg/vetkeys/vetkeys` | vetKD request types |
| ckbtc | `mo:pkg/ckbtc/ckbtc` | ckBTC satoshi conversion |

### Testing & Governance
| Package | Import | Description |
|---|---|---|
| test | `mo:pkg/test/test` | Test assertions |
| mock | `mo:pkg/mock/mock` | Mock data |
| seed | `mo:pkg/seed/seed` | DB seeding |
| dao | `mo:pkg/dao/dao` | Voting pattern |
| upgrade | `mo:pkg/upgrade/upgrade` | Upgrade hooks |
| cycles | `mo:pkg/cycles/cycles` | Cycles monitoring |
