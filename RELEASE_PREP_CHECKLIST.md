# Release Prep Checklist

Date: March 9, 2026  
Project: `zito-app`

## 1) Versioning Strategy

## App version
- Source of truth: `zito-app/app.json` -> `expo.version`
- Rule:
  - major changes: `X.0.0`
  - feature release: `X.Y.0`
  - patch/hotfix: `X.Y.Z`

## Runtime version
- `runtimeVersion.policy = "appVersion"` is enabled.
- Rule: each app version bump creates a matching runtime boundary for updates.

## Build numbers
- EAS manages build numbers remotely (`eas.json -> cli.appVersionSource = "remote"`).
- Local fallback values are present:
  - iOS: `ios.buildNumber = "1"`
  - Android: `android.versionCode = 1`

## 2) Environment Profiles

Configured in `zito-app/eas.json`:

- `development`
  - `EXPO_PUBLIC_APP_ENV=development`
  - `EXPO_PUBLIC_API_BASE=https://zito-backend.onrender.com`
- `preview`
  - `EXPO_PUBLIC_APP_ENV=preview`
  - `EXPO_PUBLIC_API_BASE=https://zito-backend.onrender.com`
- `production`
  - `EXPO_PUBLIC_APP_ENV=production`
  - `EXPO_PUBLIC_API_BASE=https://zito-backend.onrender.com`

Runtime exposure:
- `zito-app/app.config.js` publishes:
  - `extra.apiBase`
  - `extra.appEnv`
  - `extra.eas.projectId`

## 3) Pre-Release Commands

From `zito-app`:

```bash
npx tsc --noEmit
```

Android:
```bash
./gradlew.bat app:assembleRelease
```

iOS (EAS):
```bash
npm run ios:build:preview
# or for store-ready
npm run ios:build:prod
```

## 4) Smoke QA Gate (must pass)

1. Auth/login/register
2. Home sliders/grids
3. Card barcode scan
4. Price check scan/manual
5. Shopping list persistence
6. Locations search + nearest market
7. Notifications tab blink/read state
8. Profile update/password flow
9. Language switch (MK/EN/SQ/TR)
10. Dark/light visual sanity

## 5) Deployment Order

1. Deploy backend first (Render)
2. Verify `/health` and admin panel endpoints
3. Build mobile artifacts
4. Run smoke QA
5. Promote release

## 6) Rollback Plan

If release fails:
1. Revert backend to previous Render deploy
2. Restore previous mobile build in distribution channel
3. Keep DB schema backward-compatible for one release window
4. Log incident + root cause before next release

## 7) Production Safety Rules

1. Never commit `secrets/` or raw credentials.
2. Keep `.easignore` and `.gitignore` clean.
3. Tag releases in git (`vX.Y.Z`).
4. One release note entry per deployment in `LATEST_CHANGES.md`.
