# Latest Changes

## March 5, 2026 - Login language selector on first screen
- Added language switch buttons (flag chips) at the bottom of the Login/Register screen.
- Supported quick language switch: Macedonian (`🇲🇰`), English (`🇬🇧`), Albanian (`🇦🇱`), Turkish (`🇹🇷`).
- Login screen now updates language immediately when user taps a flag.
- Added translated `email_placeholder` in all supported languages and connected email input to i18n key.
- Wired `LoginScreen` props with global language state:
  - `language`
  - `onSetLanguage`
- Built and installed updated release APK on device.

## Build and install details
- TypeScript check: `npx tsc --noEmit` -> OK
- Build: `zito-app/android` -> `./gradlew.bat app:assembleRelease` -> SUCCESS
- APK installed: `zito-app/android/app/build/outputs/apk/release/app-release.apk`
- Package: `com.anonymous.zitoapp`

## March 5, 2026 - Push notifications test flow
- Backend: added authenticated endpoint `POST /push/test` in `backend/index.js`.
  - Requires auth token + Expo push token.
  - Sends a push message through Expo Push API.
  - Saves a notification item to backend notifications list.
- Mobile app (`zito-app/App.tsx`):
  - Added profile action button: "Test push notification".
  - Added i18n labels for MK/EN/SQ/TR.
  - Added state messages for:
    - test sent
    - register push token first.
  - Connected button to backend endpoint `/push/test`.
- Built and installed updated release APK.
## March 5, 2026 - Silent auto push registration
- Added silent automatic push registration right after successful login/session restore.
- App now requests notification permission and registers Expo push token automatically once per logged-in session.
- Token is auto-sent to backend via `/push/register`.
- Manual "Register push" button remains as fallback.
- Auto-register attempt resets on logout.
