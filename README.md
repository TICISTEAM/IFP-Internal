# IFP-Internal

IFP Business Central customizations — one AL extension containing all IFPC custom APIs and order business-event watchers.

| | |
|---|---|
| **App** | IFP Internal (`5515a336-244d-4b04-bbd6-1a4f6b8e5d21`) · publisher `IFP` |
| **Platform** | BC 28 (runtime 17.0), application ≥ 28.0 |
| **Environments** | `INTTEST` (sandbox) → `Production` |
| **Owner** | IS Team (ISteam@ifpc.com) |

This repo replaces five standalone apps that were previously developed and deployed separately:
`AP_Automations`, `ItemCard`, `SalesContractsAPI`, `SalesPurchaseOrders`, and `Salesperson Update`.
All object IDs were kept as-is (there were no collisions), so nothing in BC changes except which app owns the objects.

## Repository layout

```
IFP-Internal/
├── app.json                 single manifest (ID ranges, dependencies, version)
├── .vscode/
│   ├── launch.json          INTTEST deploy / attach / symbols, Production snapshot debug
│   └── settings.json        AL extension settings
├── src/
│   ├── APAutomation/        Gen. Journal Line + Vendor Ledger Entry APIs (DocuWare / AP flows)
│   ├── Items/               Item Full API (item card lookup — Copilot Studio data agent)
│   ├── Orders/
│   │   ├── Sales/           Sales Order header/line APIs + event watchers
│   │   ├── Purchase/        Purchase Order header/line APIs + event watchers
│   │   └── Shared/          TIC Event Category enum ext, TIC Order Events permission set
│   ├── SalesContracts/      Sales Contract header/line APIs
│   ├── Salespeople/         Salesperson API
│   └── Tools/               API Field Generator (admin utility page)
├── .gitignore               excludes .alpackages, .alcache, .snapshots, *.app
└── .gitattributes           line-ending normalization
```

## Object inventory

| ID | Type | Name | Area |
|---|---|---|---|
| 50394 | Page (API) | Sales Contract Line API | SalesContracts |
| 50395 | Page (Card) | API Field Generator | Tools |
| 50397 | Page (API) | Sales Contract API | SalesContracts |
| 50500 | Page (API) | TIC Sales Order Hdr API | Orders/Sales |
| 50501 | Page (API) | TIC Sales Order Line API | Orders/Sales |
| 50502 | Page (API) | TIC Purch Order Hdr API | Orders/Purchase |
| 50503 | Page (API) | TIC Purch Order Line API | Orders/Purchase |
| 50504 | Codeunit | TIC Sales Order Ship Events | Orders/Sales |
| 50505 | Codeunit | TIC Sales Order Ship Watcher | Orders/Sales |
| 50506 | Codeunit | TIC Sales Line Events | Orders/Sales |
| 50507 | Codeunit | TIC Sales Line Watcher | Orders/Sales |
| 50508 | Codeunit | TIC Sales Line Event State | Orders/Sales |
| 50509 | PermissionSet | TIC Order Events | Orders/Shared |
| 50510 | EnumExtension | TIC Event Category | Orders/Shared |
| 50511 | Codeunit | TIC Sales Hdr Event State | Orders/Sales |
| 50512 | Codeunit | TIC Purch Order Ship Events | Orders/Purchase |
| 50513 | Codeunit | TIC Purch Order Ship Watcher | Orders/Purchase |
| 50514 | Codeunit | TIC Purch Hdr Event State | Orders/Purchase |
| 50515 | Codeunit | TIC Purch Line Events | Orders/Purchase |
| 50516 | Codeunit | TIC Purch Line Watcher | Orders/Purchase |
| 50517 | Codeunit | TIC Purch Line Event State | Orders/Purchase |
| 50581 | Page (API) | Gen. Journal Line API | APAutomation |
| 50582 | Page (API) | Vendor Ledger Entry API | APAutomation |
| 50601 | Page (API) | Item Full API.IFP | Items |
| 60258 | Page (API) | Salesperson API | Salespeople |

**ID ranges in `app.json`:** 50390–50490, 50500–50649, 60200–60259 (cover the objects above) and 60390–60999 (free — use this range for new objects).

## API endpoints

All custom APIs publish under `tic`, version `v1.0`:

```
https://api.businesscentral.dynamics.com/v2.0/{tenant}/{environment}/api/tic/{group}/v1.0/{entitySet}
```

| Group | Entity set | Source table | Page |
|---|---|---|---|
| `items` | `items` | Item | 50601 |
| `contracts` | `salesContracts` · `salesContractLines` | Price List Header / Line | 50397 / 50394 |
| `integration` | `salesOrderHeaders` · `salesOrderLines` | Sales Header / Line (Order) | 50500 / 50501 |
| `integration` | `purchaseOrderHeaders` · `purchaseOrderLines` | Purchase Header / Line (Order) | 50502 / 50503 |
| `AP_Automation` | `generalJournalLines` · `vendorLedgerEntries` | Gen. Journal Line / Vendor Ledger Entry | 50581 / 50582 |
| `salespeople` | `salespeople` | Salesperson/Purchaser | 60258 |

Routes are defined by `APIPublisher`/`APIGroup`/`EntityName`, not by app or object ID — **existing consumers (Power Automate, Copilot Studio, DocuWare) keep working unchanged** after the cutover.

## Dependencies

| App | Publisher | Min. version | Needed by |
|---|---|---|---|
| International Food Products | The Ascension Group, LLC | 27.0.19.0 | all areas |
| Subscription Billing | Microsoft | 28.4.53241.53504 | SalesContracts |
| Lanham E-Ship and E-Receive | Lanham Associates | 28.0.0.0 | Orders |

## Development

1. Clone the repo and open the folder in VS Code (AL Language extension required).
2. Run **AL: Download Symbols** (`.alpackages/` is git-ignored and must be downloaded per machine).
3. `Ctrl+Shift+B` to build, `F5` with **IntTest Deploy** to publish to `INTTEST`.
4. Bump `version` in `app.json` on every change that goes to Production (`major.minor.build.revision`).

New objects go in the **60390–60999** range. Follow the existing file naming: `<ObjectName>.<ObjectType>.al`.

## Cutover from the five standalone apps (one-time)

Because this app takes over the same object IDs, the old apps must be uninstalled *before* this one is published in each environment. There are **no custom tables** in any of the old apps, so uninstalling loses no data.

Per environment (INTTEST first, then Production):

1. **Extension Management** → uninstall, in any order:
   `AP_Automations` (IFPC), `ItemCard` (IFP), `SalesContractsAPI` (IFP), `SalesPurchaseOrders` (IFP), `Salesperson Update` (IFPC).
   If an earlier `IFP Internal 1.0.0.0` is installed (INTTEST only), it is upgraded in place by this app — leave it.
2. Publish and install `IFP Internal` from this repo (`F5` for INTTEST; upload the `.app` via Extension Management for Production).
3. Re-assign the **TIC Order Events** permission set to any users/groups that had it (permission set assignments are dropped when the owning app is uninstalled).
4. **Business events:** Power Automate flows subscribed to the TIC sales/purchase order business events are bound to the *old* `SalesPurchaseOrders` app ID. Open each flow, re-select the event under the new `IFP Internal` app, and save.
5. Smoke-test one call per API group (table above) and one order change to confirm the business event fires.

## Git notes

* Never commit `.alpackages/` or `*.app` — the symbol files are ~70 MB each and GitHub will reject pushes over 100 MB.
* `.vscode/rad.json` is per-machine state and is ignored.
* Line endings are normalized by `.gitattributes`; no action needed on Windows.
