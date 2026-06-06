## Summary

<!-- What does this PR do and why? One or two sentences. -->

## Type of change

- [ ] Bug fix
- [ ] New feature / enhancement
- [ ] Refactor (no behaviour change)
- [ ] Documentation
- [ ] Chore / tooling / deps

## Pre-submission checklist

- [ ] `npx tsc --noEmit` passes
- [ ] `npm test` passes (tests added/updated for the changed behaviour)
- [ ] `cd src-tauri && cargo check` passes — and if Rust was touched, also `cargo test`, `cargo clippy -- -D warnings`, and `cargo fmt`
- [ ] App boots: `npm run tauri dev` starts without errors
- [ ] I manually exercised the change (describe how in the summary above)
- [ ] No secrets, credentials, or absolute paths in the diff
- [ ] If a new external icon or asset was added, attribution is in `NOTICE` or `public/icons/ATTRIBUTIONS.md`

> CI runs the full gate automatically (`tsc`, `npm test` + coverage, build,
> `cargo fmt`/`clippy`/`test`, dependency audit, secret scan). Running the
> commands above locally first makes for a faster review.

## How to test

<!-- Steps a reviewer can follow to verify the change works. -->

## Related issues

<!-- Closes #... -->
