# BizCath Bookends: wireframe prototype specification

Version 1.0, 26 November 2026. Clean side: this specification describes our own design and is
the only product description the builder receives, together with `docs/DESIGN_LOG.md` and
`docs/Bookends-Major-Screens.pdf` (screen references A to N below match that PDF).

## 1. Rules for the builder

- Build from this specification, the design log and the screens PDF only.
- Do not research, download, open or describe other apps in this category, and do not use
  anything you remember about how any existing wellbeing, habit, meditation or quote app works.
  If something here is unclear, ask the owner; do not fill the gap by imitating an existing app.
- All words, lines and notes in the prototype are placeholders written for this project, listed
  in section 9. Do not add quotes from memory.
- Everything visual is a wireframe (section 4). No art, illustrations, icons from other apps,
  fonts other than the system font, or sounds.
- Dependencies must be open source under a permissive licence (MIT, BSD, Apache-2.0). No Google
  Play services, no Firebase, no analytics, no crash reporters, no ads.
- Screenshots you take go in pull requests only, and show only this app.

## 2. The product

BizCath Bookends is a free, open-source daily ritual app for adults. It has two short moments a
day and nothing that asks for attention in between.

- **Morning, with Toast (a sun):** how are you feeling; optionally one small thing for the day,
  suggested to fit the feeling; a line to carry through the day. The feeling of the morning:
  *the day is going to go well.*
- **During the day, only if you open it:** calm and focus. Breathe, ground yourself, refocus,
  or a focus session.
- **Evening, with Cocoa (a moon):** how are you feeling now, shown beside the morning; did the
  small thing happen (only if one was set); one good thing; a note for Toast; one breath; goodnight.
  The feeling of the evening: *everything is fine, and exactly where it needs to be.*

Toast takes the goal in the morning and Cocoa receives it in the evening. Toast and Cocoa never
meet; they leave each other short notes through the user.

Rules that apply everywhere:
- Nothing is ever locked, bought or advertised.
- Nothing punishes: no streak that breaks, no "missed" labels, no guilt wording. Skipping is
  always allowed.
- The evening accepts the day whatever happened. No scores.
- Bookends is not a medical or crisis service, says so in About, and always offers a helpline
  link from Steady.

## 3. Scope of this prototype

**In:** all 14 major screens (A to N), the extra Steady screens (F2 to F4), Today's four
states, local storage, the debug menu, two daily reminders as real notifications, the
home-screen widgets, data export and delete, accessibility basics.

**Out:** final art, colours, typography and wording; sound (controls exist but play nothing;
see 6.F4); iPhone build; sync and backup (shown as "later"); tips; onboarding beyond the
minimum in 6.0; translations.

## 4. Wireframe style

- Greyscale only, using the platform's default (Material 3) components with a neutral grey
  seed colour. System font. Light theme by day, a dark-grey theme for the evening screens (H,
  I, J) and for Today in the evening and night states.
- **Toast** is drawn as an outlined circle labelled "TOAST". **Cocoa** is an outlined crescent
  labelled "COCOA". No faces. Their words appear in a plain speech bubble next to them.
- Lines are shown in a dashed-outline card in italic.
- Minimum touch target 48 dp. Everything readable at 200% text size.

## 5. Platform and architecture

- Flutter (current stable), Dart 3. Android first: `minSdkVersion` 26, target the current SDK.
  Package name `com.bizcath.bookends` (placeholder until the company is registered).
- Structure: MVVM as described in Flutter's architecture guide.
  ```
  lib/
    main.dart
    app/            routing, theme, Today state machine
    ui/<feature>/   <feature>_screen.dart + <feature>_view_model.dart
    domain/models/  plain immutable data, no Flutter imports
    data/
      repositories/ the source of truth
      services/     database, notifications, widget bridge, clock, export
  test/             mirrors lib/
  android/          including the native widget code
  ```
- Rules: a view talks only to its view model; view models hold repositories privately; only
  repositories use services; models are plain and immutable. Each view model and repository has
  a test file. No file over 400 lines.
- Suggested packages (all permissively licensed; check before adding): `drift` (+ `sqlite3_flutter_libs`)
  for storage, `flutter_local_notifications` and `timezone` for reminders, `home_widget` for
  the Android widget, `go_router` for navigation, `share_plus` for export, `url_launcher` for
  the helpline link.
- **Privacy:** the release build declares no `INTERNET` permission. Nothing leaves the phone.
- **Time:** all time-of-day logic reads from a `ClockService` so the debug menu can override it.

## 6. Screens

Screen letters match the PDF. Every multi-step flow shows a step label ("Morning · 1 of 3") and
a back control; every question has "Skip".

### 6.0 First run (minimum)
Three screens: (1) Toast and Cocoa introduce the idea in two sentences each; (2) choose morning
reminder time (default 07:30) and evening time (default 21:30); (3) a short note that Bookends is
not a medical or crisis service. Then Today. The notification permission is requested after
the first morning is completed, not before.

### Today (tab 1): states
Today shows one of four states, decided by the clock and what is done today. A "day" runs from
04:00 to 03:59 local time.

| State | When | Screen |
|---|---|---|
| Before the morning | morning not done, now before evening time | A |
| During the day | morning done, now before evening time | E |
| Evening | now at or after evening time, evening not done | Today shows Cocoa and "Talk to Cocoa" (starts H) |
| Night | evening done | Today shows Cocoa's goodnight words, the day's summary, and "Steady" only |

If the morning was never done, the morning is simply not offered after the evening time.
Nothing says it was missed. Steady is available in every state.

### A. Today, before the morning
- Greeting with date and time.
- Toast with a hopeful placeholder sentence (rotates daily).
- Primary button "Start the day with Toast" → B.
- Last night's evening feeling, if any ("Last night you said: calm").
- Card: "Days you showed up: N". N counts days with the morning or evening done. Never resets.
- Floating button "Steady" → F.
- Bottom navigation: Today, Look back, Lines, Settings.

### B. Morning 1 of 3: how are you?
- Toast: "Morning! How are you feeling?" (placeholder, rotates).
- Feelings as chips, single choice: the list in 9.1.
- Strength slider with three stops: a little, some, a lot (optional, default unset).
- Optional text field "A word about why" (max 80 characters).
- "Next" → C. "Skip for today" → C with no feeling stored.

### C. Morning 2 of 3: one small thing
- Toast says one sentence matched to the chosen feeling (9.2).
- One suggestion card at a time, taken from the suggestion list for that feeling (9.2).
- Chips: "Use this", "Another" (next suggestion), "Write my own" (text field, max 60 characters).
- Secondary button "No goal today — that's fine" → D with no goal.
- "Next" → D.

### D. Morning 3 of 3: Toast's line
- Toast: "One for the road."
- The line card (choice rule in 9.3), with "Save" (favourite) and "Share" (shares the text with
  its attribution via the system share sheet).
- Under the line: "From Toast", or for a found quote "Author, *Work*, Year".
- Summary card: today's feeling and goal.
- Primary button "Have a good day" → saves the morning, updates the widget, → E.

### E. Today, during the day
- Today's line card.
- Card "Toast is carrying": the goal and this morning's feeling (or "No goal today").
- Small text: "Cocoa will ask how it went this evening." (only if a goal is set).
- Card "Need a moment?" → F. Floating "Steady" → F.

### F. Steady
- "How long have you got?" chips: 1 min, 3 min, 5 min (default 3). Applies to Breathe, Ground
  and Refocus.
- Four rows:
  - **Breathe** → G.
  - **Ground yourself** → F2.
  - **Refocus** → F3.
  - **Focus session** → F4 (has its own length).
- A suggestion line chosen by this morning's feeling: anxious or wired → Breathe; low or tired →
  Ground yourself; otherwise → Refocus.
- Link at the bottom: "Need more help? Talk to someone now" → opens https://findahelpline.com in
  the browser.

### F2. Ground yourself
A guided sequence, one prompt per screen, advancing on tap or automatically: notice five things
you can see, four you can feel, three you can hear, two you can smell, one you can taste. The
chosen length sets the pace. Ends with "Done" → back to Today.

### F3. Refocus
1. A short guided breath (30 seconds for 1 min, 60 for 3, 90 for 5).
2. "What are you coming back to?" showing the goal Toast is carrying, if any, with a text field
   to type something else (not stored beyond today).
3. "Off you go." → back to Today.

### F4. Focus session
- Choose a length: 15, 25 or 45 minutes (default 25), and "Background sound" on or off (prototype:
  the switch is shown and saved but plays nothing).
- Optional "What are you working on?" (prefilled with today's goal).
- Running screen: time left as large text, a progress ring, pause and stop. Keeps the screen on.
  Survives the app going to the background (show an ongoing notification while running).
- At the end: a 1-minute breather (as G at 1 min), then "Nice work. That's done." → Today.
- Stopping early is never labelled as failing.

### G. Breathe
- A circle that grows over the in-breath and shrinks over the out-breath, with the words
  "breathe in" / "breathe out" and the time left.
- Patterns (chips): Even (4 in, 4 out), Longer out (4 in, 6 out), Box (4 in, 4 hold, 4 out, 4 hold).
- With reduced motion (system setting or app setting): no animation, only the words and a
  count.
- Optional gentle haptic at each change (on by default).
- "Stop" at any time.

### H. Evening 1 of 3: how are you now?
- Dark-grey theme from here to J.
- Cocoa: "Evening. How are you feeling now?" (placeholder, rotates).
- Card "This morning: <feeling> · <strength>" (or "No check-in this morning").
- Same feelings chips, strength slider and optional why field as B.
- "Next" → I. "Skip for tonight" → I.

### I. Evening 2 of 3: the day, accepted
- If a goal was set: Cocoa: "Toast passed me your <goal>. How did it go?" Chips: Did it, Partly,
  Not today. Any answer shows: "Whatever happened, the day is done. That's fine."
- Always: "One good thing from today?" Chips: people, rest, outside, a small win, work, write
  my own (text field, max 120 characters). Optional.
- "Next" → J.

### J. Evening 3 of 3: goodnight
- Cocoa: "Everything is exactly where it needs to be. Goodnight." (placeholder, rotates).
- Card "A note for Toast": a sentence built from the template rules in 9.4, editable.
- Secondary button "One slow breath" → G with one breath, then back to J.
- Small text: "Bookends will stay quiet until morning."
- Primary "Close the day" → saves the evening, updates the widget, Today goes to the Night state.

### Next morning
On the next morning's A and B, Toast shows Cocoa's note in its speech bubble before asking how
you are.

### K. Look back (tab 2)
- Chips: Week, Month (default), Year.
- Calendar where each day is split in two: top half the morning feeling, bottom half the evening
  feeling, as grey tones by feeling (9.1 gives each feeling a tone). Empty halves are blank,
  never marked.
- Card "What we've noticed": appears only after 14 days with both moments; shows at most two
  sentences produced by the rules in 9.5. Plain words, no numbers, no scores.
- List of recent days; tapping a day opens Day detail: morning and evening feelings with
  strength and why, goal and outcome, good thing, the line, and the notes between Toast and Cocoa.

### L. Lines (tab 3)
- Chips: Saved, My own, Notes.
- Saved: favourite lines with their source.
- My own: the user's lines; "+ Write a line of my own" (max 140 characters); switch "Let Toast
  use my lines some mornings" (default on).
- Notes: the notes between Toast and Cocoa, newest first, grouped by day.

### M. Settings (tab 4)
- Morning reminder (time, on/off), Evening time and reminder (time, on/off).
- Haptics on/off; Reduced motion: follow system / on / off.
- Feelings: show or hide feelings from the list (cannot add in the prototype).
- Export my data (JSON via share sheet). Delete everything (two-step confirmation).
- Sync & backup: row shown, disabled, labelled "later".
- Help now (opens the helpline link). About → N.

### N. About
- App name, version, build type ("debug" / "official").
- "Made by Allen. Free for life. No ads, no subscriptions. Open source."
- Rows: Watch the channel (placeholder URL), More free apps (https://bizcath.com), Tip the maker
  (disabled, "later"), Open-source licences (Flutter's licence page).
- "Nothing leaves your phone." "Bookends is not a medical or crisis service."
- Long-press the version number to open the debug menu.

## 7. Reminders and widgets

**Reminders.** Exactly two local notifications a day, at the morning reminder time ("Toast is up.
How are you this morning?") and the evening time ("Cocoa's here when you're ready."). Each can be
switched off. No other notifications, except the ongoing one during a focus session. Tapping a
reminder opens B or H. Reschedule on time-zone change and after reboot.

**Widgets (Android, native, via `home_widget`).**
1. **Main widget (medium):** before the morning: Toast and "Tap to start" → B. During the day:
   today's line, feeling and goal → E. Evening: Cocoa and "How are you now?" with this morning's
   feeling → H. Night: Cocoa's goodnight words → Today.
2. **Steady widget (small, optional):** three buttons: Breathe 1 min → G, Ground 3 min →
   F2, Refocus 3 min → F3.
Widgets update when a moment is completed and at the evening time.

## 8. Data (stored on the phone with drift)

- **Day:** date (04:00-based), morning feeling, morning strength, morning why, goal text, goal
  source (suggested / own / none), line id, morning completed at; evening feeling, evening
  strength, evening why, goal outcome (did / partly / not today / null), good-thing kind,
  good-thing text, evening completed at.
- **Line:** id, text, source (toast / found / own), author, work, year, checked source (for found
  quotes), favourite, created at.
- **Note:** id, day date, from (toast / cocoa), text.
- **Steady session:** id, kind (breathe / ground / refocus / focus), length, started at, completed
  (bool). Used only for Look back day detail; never shown as a count or score.
- **Settings:** reminder times and switches, haptics, reduced motion, hidden feelings, let Toast
  use my lines, first-run done.
- **Export** writes all of the above as one JSON file. **Delete everything** wipes the database
  and settings and returns to first run.

## 9. Placeholder content (prototype only; final words come later)

### 9.1 Feelings
calm, hopeful, content, tired, anxious, low, wired, not sure. Each has a grey tone for Look back
from light (calm, hopeful, content) to dark (anxious, low), mid-grey for tired and wired,
hatched for not sure.

### 9.2 Toast's sentence and suggestions by feeling
- calm / content: "Lovely. Let's keep it gentle." Suggestions: a ten-minute walk; drink a glass
  of water now; tidy one small surface.
- hopeful: "Feeling hopeful? Here's something small to carry that along." Suggestions: start the
  thing you've been putting off, for five minutes; message someone you like; step outside at lunch.
- tired: "Tired is allowed. Let's keep it small." Suggestions: one early night; a five-minute
  rest with eyes closed; one easy meal.
- anxious / wired: "Let's give the day one steady thing." Suggestions: three slow breaths before
  each meeting; write the worry down once; a short walk.
- low: "Thanks for telling me. Something very small, then." Suggestions: open a window; one
  shower; one kind message to yourself.
- not sure / skipped: "That's fine. Here's an easy one." Suggestions: a glass of water; a short
  walk; one thing you'd like to finish.

### 9.3 Lines
Twenty placeholder lines from Toast (below). The line for the day is chosen without repeating
any line from the last 14 days; if "Let Toast use my lines" is on, one in five mornings may use
one of the user's own lines. Found quotes: include one entry marked `[found quote placeholder —
to be sourced and checked]` with author "Author", work "Work", year "Year" to exercise the
display; do not add real quotes.

1. Here is a fine place to start. 2. Small steps still count. 3. Today doesn't have
to be perfect to be good. 4. You've done hard days before. 5. One thing at a time. 6. Kindness
counts, especially to yourself. 7. The day is still wide open. 8. Slow is still moving. 9. You're
allowed to take up space. 10. Good things can be small. 11. Rest is part of the work. 12. Notice
one nice thing today. 13. You don't have to carry it all at once. 14. Let today be simple.
15. Breathe first, then decide. 16. You can start again at lunch. 17. It's fine to ask for help.
18. Finished is good enough today. 19. Today, just show up. 20. Something good is on its way.

### 9.4 Note templates
- Cocoa to Toast (built in J from the evening answers): "<Name> was <evening feeling> tonight
  [and <did / partly did / didn't get to> <goal>]. [They said <good thing>.] Be gentle with them
  in the morning." Use the user's first name if given at first run, otherwise "they".
- Toast to Cocoa (stored when the morning is completed): "<Name> started the day <morning
  feeling> and is carrying <goal / nothing in particular>. Look after them tonight."

### 9.5 "What we've noticed" rules (prototype)
After 14 days with both moments, compute and show at most two of these, only when the
difference is clear (at least 6 days in each group and a difference of at least one feeling
tone step on average):
- Evenings after days with good thing "outside" versus other days.
- Evenings after days with a goal "did it" or "partly" versus days with no goal.
- Mornings after evenings logged after 23:00 versus earlier.
Wording pattern: "Evenings were calmer on days you went outside." Never use numbers.

## 10. Debug menu (debug builds only)
Opened by long-pressing the version number in About.
- Override the clock: pick a time and date, or jump to Before the morning / During the day /
  Evening / Night.
- Seed 30 days of varied sample data; clear all data; reset first run.
- Fire the morning or evening notification now; refresh the widgets now.

## 11. Accessibility
- Every control has a TalkBack label; Toast and Cocoa are announced as "Toast, the morning
  character" and "Cocoa, the evening character".
- Works at 200% text size without clipped text. Contrast at least 4.5:1.
- Respects the system reduced-motion setting; the app setting can override it.
- No information conveyed by colour or tone alone: the Look back calendar has a text list view.

## 12. Milestones and acceptance

Each milestone ends with: analyser clean, tests passing, a debug APK built on the Mac, installed
on the phone, and a short report with screenshots of this app only.

| | Delivers | Accepted when |
|---|---|---|
| M1 | Project setup, architecture, theme, bottom navigation, Today with its four states, debug clock override | Switching the debug clock moves Today through all four states correctly |
| M2 | First run, morning B–D, evening H–J, storage, notes between Toast and Cocoa | A full morning and evening can be done; answers survive an app restart; the note appears the next morning |
| M3 | Steady F, F2–F4, Breathe G, Look back K with day detail, Lines L, Settings M, About N, export and delete | Every screen in this spec is reachable and works; export produces readable JSON; delete returns to first run |
| M4 | Two reminders, focus-session ongoing notification, both widgets, accessibility pass | Reminders fire at the set times (also after reboot); widgets show the right state and open the right screen; TalkBack can complete a morning |

## 13. Repository setup
- `README.md` (what it is, how to build), `ARCHITECTURE.md` (section 5 in plain words),
  `AGENTS.md` (the rules in section 1 and 5 for any AI agent), Apache-2.0 `LICENSE` and `NOTICE`.
- `docs/` holds this spec, the design log and the screens PDF.
- Each source file carries the line "Copyright the BizCath contributors."
- No brand art in the repository.
