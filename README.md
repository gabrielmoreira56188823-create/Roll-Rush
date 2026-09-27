# Roll Rush

GitHub Pages + Supabase multiplayer dice-board game.

## Included
- Public GitHub Pages-ready frontend
- Supabase email/password accounts
- Real player records; no hard-coded fake leaderboard players
- Shared live leaderboard and endless board
- Supabase Realtime player updates plus 1-second refresh fallback
- Animated dice
- 1/2/3 immediately enters the Low-Roll Risk Round
- Two-dice doubles survive the normal risk round; snake eyes can be selected as an all-or-nothing risk
- Cash out run points into banked points
- Shop upgrades paid with banked points
- Other players shown by first and last username letters; your marker says YOU
- Infinite board rendering around the current player position

## Setup
1. Create a public GitHub repository named `roll-rush`.
2. Upload `index.html`, `config.js`, `supabase_schema.sql`, and `README.md`.
3. In Supabase SQL Editor, run `supabase_schema.sql`.
4. In Supabase Authentication, configure email confirmation and Site URL/Redirect URLs for your final GitHub Pages URL if required.
5. In GitHub: Settings -> Pages -> Deploy from a branch -> `main` -> `/root` -> Save.

The browser publishable key is intentionally in `config.js`. Never put a Supabase secret/service-role key there.

## Security note
The UI uses the authenticated player's row policies, but a production competitive game should move dice resolution and score mutations into trusted server-side/database functions so clients cannot tamper with results. This package provides the working public multiplayer architecture, not a gambling-money service.
