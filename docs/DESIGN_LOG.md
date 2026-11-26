# BizCath Bookends: design log

Status: started 25 November 2026. Clean side. This file names no existing product and is
written in our own words. After a scrub review it moves to the app's own repository, where the
builder may read it.

Each decision has an ID, a date, what was decided, the alternatives considered, and why.
Decisions are never deleted; a reversed decision gets a new entry that supersedes it.

## The product in one paragraph

BizCath Bookends is a free, open-source daily ritual app. It has two short moments a day and
nothing in between: about two minutes in the morning and three at night. Two characters share
the ritual: Toast, a sun who looks after mornings, and Cocoa, a moon who looks after evenings.
Toast takes the day's one goal in the morning; Cocoa takes it back at night and asks how it went.

## Decisions

### D1. The product is a morning-and-evening ritual (25 Nov 2026)
- **Decided:** Two short moments a day, a morning one and an evening one, and nothing in
  between. The app stays out of the way during the day.
- **Alternatives:** an in-the-moment calming tool; a small-goals habit builder with rewards;
  a focus-session tool; a feelings tracker that finds patterns over time.
- **Why:** The owner judged it closest to what people in this market actually want: a calm
  start and end to the day, without an app that asks for attention all day.

### D2. The features (25 Nov 2026)
- **Core:** a feeling check-in; one goal for the day; a short line chosen for the user; an
  evening reflection (did the goal happen, one thing that went well); an evening wind-down;
  a home-screen widget.
- **Supporting:** guided breathing; a mood calendar; a count of days the user showed up that
  never breaks; favourite lines and the user's own lines; two reminders at times the user
  chooses.
- **Left out:** goal lists and points; a shop or currency; a focus timer; lines through the
  whole day; anything to buy inside the app.
- **Why:** Each moment must fit in two or three minutes. Everything else was either pressure,
  clutter, or a different product.

### D3. The morning and evening moments (25 Nov 2026)
- **Morning, about 2 minutes:** how are you feeling; pick one goal for today; receive a line
  to carry through the day (shown on the widget).
- **Evening, about 3 minutes:** did the goal happen; one thing that went well; one slow
  breath; then the screen dims into a wind-down.
- **Reminders:** two, at times the user chooses. Nothing else is ever sent.

### D4. Two characters: a sun and a moon, with a handover (25 Nov 2026)
- **Decided:** The morning character takes the user's goal and carries it through the day;
  the evening character receives it back and asks how it went. The user is the go-between.
  The two characters never meet; they leave each other short notes through the user, which
  build into a small story over the weeks.
- **Alternatives:** a slow animal on a long walk; a house plant that opens and folds its
  leaves; an independent pet with no care duties; a small radio with a morning and a late show.
- **Why:** The owner chose this for how well the icons and names fit. A sun and a moon say
  "morning" and "evening" instantly, in the widget, the icon and the store listing. The
  handover makes the two moments one connected ritual.

### D5. The characters are named Toast and Cocoa (25 Nov 2026)
- **Toast** is the sun, for mornings: breakfast, warmth, gold.
- **Cocoa** is the moon, for evenings: a bedtime drink, dark brown, comfort.
- **Alternatives considered and rejected:** about fifteen names, most of them single words for
  morning, night, sleep or calm, all already used by apps in this category; and two names in
  common use elsewhere. Other pairs considered: Honey and Ink; Marmalade and Mallow; coined
  names.
- **Why:** The names fit the icons and the two moments, feel warm and gentle, and were not
  found in use in this category. See D10 for the trademark check.

### D6. Rules every character follows (25 Nov 2026)
- They never suffer: never hungry, sad, sick, lost or dying. Missing a day costs nothing; if
  an evening is missed, the morning character simply finds the goal waiting the next day.
- They never ask for more than the two moments the user chose.
- What builds up only moves forward and is never taken away.
- Everything works with sound off and with reduced motion.

### D7. Art direction, first statement (25 Nov 2026)
- **Cute is allowed.** The owner sets the art direction.
- **Two halves of one style:** warm, soft, rounded and lightly grained for mornings; cool,
  quiet, starlit and slightly more geometric for evenings. The whole app shifts from the day
  palette to the night palette at the evening moment.
- **Must not look like a toddler sleep-training product.** The difference is in framing,
  store screenshots and words, not in how cute the characters are. Avoid the visual conventions
  of children's wake-up clocks and sleep trainers: day/night signalling aimed at small children,
  countdown imagery, swapping faces, traffic-light colours, nightlight glow, toy-like shapes,
  dress-up rewards, and any age signal aimed at small children.
- **Palette:** the placeholder below follows a common yellow-sun and navy-night convention. The artist must move away from it, for example by using the
  breakfast and bedtime-drink colours the names suggest. Placeholder only: day gold
  `#f3c98b`, sunrise `#e58e5a`, morning paper `#f8ecdf`; night blue `#2b3a67`, moonlight
  `#8d9ad6`, deep night `#141b33`.
- **Type:** a friendly rounded sans for Toast's words; a quiet serif for Cocoa's.

### D8. Free for life, and how money may come in (25 Nov 2026)
- The app is free and complete forever: no ads, trials, paywalls, discount screens or
  purchases inside it. Nothing about the characters can be bought.
- **Later, part of the design:** optional sync and encrypted backup between devices, charged
  at cost plus a stated margin through the store's billing. Self-hosting stays free. No feature
  is held back for subscribers.
- **Readings:** lines and wind-downs read aloud by a synthetic voice are free. Content read
  and recorded by a person is a subscription.
- **Not now:** physical products (a printed journal, a printed year, merchandise); promoting
  the owner's channel and products beyond the About screen; tips and donations; deployments
  for organisations.

### D9. App name: BizCath Bookends (25 Nov 2026)
- Follows the house naming rule: the BizCath prefix plus a plain description. Under 30
  characters. "Bookends" is never used without the prefix.

### D10. Trademark check (25 Nov 2026)
- **Method:** TMview search of the US, EU, UK and WIPO registers; live marks reviewed in
  classes 9, 41, 42 and 44. Not legal advice; an attorney confirms before filing or launch.
- **Clear:** "Toast & Cocoa" as a pair; "BizCath"; "BizCath Bookends".
- **Taken on their own:** "Toast" (largest owner a restaurant-software company, in software
  classes); "Cocoa" (largest owner a major computer company, in software classes); "Bookends"
  (a therapy practice in the US; a skincare brand in the UK and WIPO).
- **Rule that follows:** Toast and Cocoa are character names inside the app. As a brand (store
  art, future products) they appear only as the pair "Toast & Cocoa", never singly. "Bookends"
  appears only as "BizCath Bookends".

### D11. Stay distinct in how the ritual is described (25 Nov 2026)
- **Decided:** Store text describes the ritual through Toast and Cocoa and the handover, not
  through counts of minutes or steps.
  Feature names are our own and checked (D10 method) before use; names for a night screen, a
  calm-down tool or a gratitude feature get particular care, because many are already used.
- **Why:** The handover between two characters is what makes the ritual distinct.

### D12. No currency, no outfits, no space to decorate (25 Nov 2026)
- **Decided:** Nothing is earned to spend. The characters cannot be dressed up, and there is no
  place to decorate. What builds up is the story told in Toast and Cocoa's notes, and the
  user's own record of days.
- **Why:** Spending loops push people to open an app more, and they are where buying usually
  creeps in. It also keeps Bookends clearly apart from companion apps built on rewards.

### D13. Version 1 is for adults (25 Nov 2026)
- **Decided:** Adults. No children's edition in version 1.
- **Why:** The owner's call. It keeps the store's children's-app rules out of scope and fits the
  art-direction rule against looking like a children's product (D7).

### D14. How art and writing get made: to be decided, after the design document (25 Nov 2026)
- **Leaning:** image tools (Midjourney) and Claude, with the owner choosing. Look and feel are
  settled only after the design document is complete.
- **Rules that apply whatever the tools:**
  - Prompts never name or describe an existing product, character or brand, and never include
    images of one. They describe Toast, Cocoa and the world in our own words, from this log.
  - Keep a record of each final asset: tool, date, prompt, and the edits made by hand.
  - Check each tool's terms allow commercial use of what it makes.
  - Images made purely by an AI tool may not be protected by copyright in the US. The
    characters' protection then rests on the trademark (D10) and on the hand-made changes, so
    the final art should carry real human work.
- **The notes between Toast and Cocoa** are made the same way: drafted with Claude, chosen and
  edited by the owner. How many, and how long the story runs, are settled in the design
  document.

### D15. Where the daily lines come from: a mix (25 Nov 2026)
- **Decided:** Mostly our own lines, written in Toast's voice, drafted with Claude and chosen
  and edited by the owner. Now and then, a public-domain quote that Toast "found" and passes on.
- **Alternatives:** only our own lines; only public-domain quotes.
- **Rules for quotes:**
  - Only from people who died long enough ago that the work is public domain in the US, UK and
    EU (in practice, authors who died more than 70 years ago, from works published before 1931).
  - Every attribution checked against the original text or a reliable verified source before
    use; doubtful attributions are dropped, not fixed.
  - No film, song or television lines, and nothing from living people.
  - Each quote is stored with its author, work, year and where it was checked.
- **Volume:** about a year's worth (roughly 365) before a line repeats, produced in batches.
- **Why:** Our own lines keep the voice consistent and fully ours; an occasional well-sourced
  quote adds variety without the attribution problems common in quote collections.

### D16. The spine is feelings (25 Nov 2026)
- **Decided:** The loop is built around feeling check-ins, morning and evening. Toast asks how
  you are at the start of the day; Cocoa asks again at the end and shows the morning answer
  beside it. The goal of the day becomes optional, suggested by Toast to fit the feeling; "did it
  happen?" is asked only when one was set. The look-back shows mornings and evenings side by side
  and describes patterns in plain words, never as a diagnosis.
- **Alternatives:** the goal as the spine; one good thing as the spine; the evening wind-down as
  the spine; Toast and Cocoa's story as the spine.
- **Why:** The owner's choice. It is the gentlest loop and never asks the user to achieve anything.

### D17. The emotional arc of the day (25 Nov 2026)
- **Morning (Toast):** the day is going to go well. Hopeful, warm, light.
- **During the day:** calm and focus are there if you need them, and only then.
- **Evening (Cocoa):** everything is fine, and exactly where it needs to be. Acceptance, not review.
- **Consequence:** the evening never grades the day. "Did it happen?" is answered with acceptance
  whatever the answer; Cocoa's words close the day as complete.

### D18. A daytime moment of calm and focus, on demand (25 Nov 2026)
- **Decided:** Between the two moments the user can open a short calm-and-focus moment: choose
  how long you have (1, 3 or 5 minutes), then breathe, ground yourself, or settle and return to
  what you were doing. A helpline for the user's country is always one tap away.
- **This revises D1 and D2:** the app still never asks for attention during the day (no daytime
  reminders), but it is there when opened. "Nothing in between" now means "nothing that asks".
- **Still left out:** a work focus timer for long sessions.

### D19. A wireframe prototype on Android first (26 Nov 2026)
- **Decided:** Build the 14 major screens at wireframe level as a working Android app (APK),
  in a new private repository `bizcath-bookends`, made public at launch.
- **Scope:** everything: the four tabs, Today's states, the morning and evening flows, calm and
  focus, look back, lines, settings, about, the two reminders as real notifications, and the
  home-screen widget. Plus a debug menu to jump between times of day.
- **Builds:** made on the owner's Mac and installed on a phone. GitHub Actions is kept for
  store builds (Google Play and TestFlight) later.
- **Clean room:** the builder works in a fresh session in that repository, from the clean
  specification only.

### D20. Daytime focus means both a refocus and a focus session (26 Nov 2026)
- **Decided:** The calm-and-focus moment (D18) offers four things: Breathe, Ground yourself,
  Refocus (one to five minutes: settle, then see what you were working on and go back to it),
  and a Focus session (a timer for a stretch of work, with optional calm sound and a short
  breather at the end).
- **This revises D2 and D18:** a focus timer was left out; it is now in, inside calm and focus
  only. The app still never asks for attention during the day.

### D21. The daytime moment is called "Steady" (working name, 26 Nov 2026)
- **Decided:** The daytime calm-and-focus moment (D18, D20) is labelled "Steady" in the app,
  its widget and its data. Its switch for sound is "Background sound".
- **Why:** The scrub review found the earlier label leaned on a word another company uses as a
  brand. "Steady" covers both calming down and focusing. Working name: to be confirmed by the
  owner and name-checked (D10 method) before launch.

## Open questions

1. **Final tools for art and writing,** after the design document (D14).
