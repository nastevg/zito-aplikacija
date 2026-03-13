# iOS Parity QA Checklist

Date: March 9, 2026  
Scope: Verify iOS behavior matches current Android app behavior.

## 0) Setup on macOS
1. `git clone https://github.com/nastevg/zito-aplikacija.git`
2. `cd "zito aplikacija/zito-app"`
3. `npm install`
4. Login if needed: `npm exec -- eas-cli login`
5. Build/run path:
- Simulator build: `npm run ios:build:dev`
- Local simulator run (Xcode installed): `npx expo run:ios`

## 1) Authentication Flow
1. Open app cold start.
2. Check language selector on login (MK/EN/SQ/TR) updates all login labels.
3. Test email login success and failure states.
4. Test register flow with/without loyalty card.
5. Test OAuth start links (Google/Facebook) open correctly.

Pass criteria:
- Labels/text are identical in meaning and order to Android.
- No clipped controls on small iPhone screens.

## 2) Home Screen
1. Verify logo, barcode card, `ТЕКОВНИ ЛЕТОЦИ`, `НАЈДОБРИ АКЦИИ`.
2. Swipe current flyers horizontally; infinite recenter still works.
3. Confirm best deals grid scrolls smoothly and keeps 3-per-row layout.
4. Check points/coupons cards and shopping list shortcut.

Pass criteria:
- Spacing and typography visually match Android intent.
- No jumpy scroll/re-render artifacts.

## 3) Flyers Screen
1. Verify list rendering and card layout (2 columns).
2. Verify open shopping list shortcut button.

Pass criteria:
- No overflow or truncated content.

## 4) Card Screen
1. Open barcode scanner.
2. Grant/reject camera permission and verify proper status message.
3. Scan loyalty barcode and confirm card update state.

Pass criteria:
- Camera overlay and close action work cleanly.
- Permission denial is handled gracefully.

## 5) Price Check Screen
1. Scan product barcode from camera.
2. Test manual barcode input.
3. Verify product found/not-found/invalid barcode statuses.

Pass criteria:
- Returned product price block shows name, value, barcode, updated timestamp.

## 6) Shopping List Screen
1. Add items with quantity/note.
2. Toggle done/undone.
3. Remove one item.
4. Clear purchased items.
5. Restart app and verify persistence.

Pass criteria:
- State persists after restart.
- Sorting and done styling match Android behavior.

## 7) Locations Screen
1. Use city chips (`Сите` + settlements).
2. Test search filter by market/address/settlement.
3. Tap `Најблизок маркет` and allow/reject location permission.
4. Tap `Отвори во мапа`.

Pass criteria:
- Nearest market highlight works.
- GPS error states are readable and accurate.

## 8) Notifications Screen + Tab Blink
1. Trigger notification arrival (real backend or controlled test event).
2. Verify tab icon blinks when unread exists.
3. Open notifications tab and confirm blink stops.

Pass criteria:
- Blink state transitions are deterministic and reset on focus.

## 9) Profile Screen
1. Verify profile info cards (name, email, push state/token, profile state).
2. Test update basic data.
3. Test password change states (mismatch, short, invalid current, success).
4. Verify language switch and refresh button.

Pass criteria:
- No control overlap with keyboard/safe area.

## 10) Bottom Navigation
1. Verify tab order and spacing:
- `Почетна`, `Летоци`, `Цени`, `Известувања`, `Листа`, `Повеќе`
2. Verify hidden screens still open through `Повеќе`:
- `Картичка`, `Локации`, `Профил`

Pass criteria:
- Same structure and behavior as Android.

## 11) Theme and Visual Consistency
1. Toggle light/dark.
2. Verify background, cards, borders, typography contrast.
3. Verify headline readability (`ТЕКОВНИ ЛЕТОЦИ`, `НАЈДОБРИ АКЦИИ`).

Pass criteria:
- No low-contrast text or unreadable headers.

## 12) iOS-Specific Checks
1. Camera permission prompt wording.
2. Location permission prompt wording.
3. External link handoff (Maps/OAuth).
4. Safe-area on iPhone with notch/dynamic island.

Pass criteria:
- Native permission prompts appear with correct descriptions.

## Defect Reporting Format (use this in chat)
For each issue send:
1. Screen name
2. Expected behavior
3. Actual behavior
4. Screenshot
5. Device (iPhone model + iOS version or Simulator model)

I will fix issues in batches and return with:
1. what changed
2. where it changed
3. what to retest
