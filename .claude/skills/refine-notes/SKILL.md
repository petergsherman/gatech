---
name: refine-notes
description: Use when the user asks to refine rough notes, transcribe a handwritten lecture PDF, process notes from the rough notes folder, or add notes to the running document
---

# Refine Notes

Turn a handwritten lecture PDF into a faithful LaTeX-markdown transcription with a cross-check pass, then append it to the course's running document.

## File conventions

Each course lives in its own top-level vault folder (e.g. `AE6353 - orbital mechanics/`):

| Path | Role |
|---|---|
| `<course>/rough notes/M-D-YYYY rough notes.pdf` | Input — handwritten iPad PDFs |
| `<course>/refined notes/YYYY-MM-DD refined notes.md` | Output — one file per rough PDF |
| `<course>/refined notes/diagrams/YYYY-MM-DD fig<n>.svg` | Redrawn diagram SVGs |
| `<course>/<course code> - Running Notes.md` | Running document, newest appended at the bottom |

## Formatting rules

- **One continuous document.** No page headings or page markers of any kind. An arrow at a page edge pointing to the next page means the thought simply continues — merge it silently, never mention the page break.
- **Match ink colors.** Colored pen (red, blue, green, …): prose becomes `<span style="color:red">…</span>`; math becomes `$\textcolor{red}{…}$` (embedded words via `\text{…}`). Default black/gray ink is plain text.
- **Purple = AI voice.** Anything the AI infers or interprets — an unclear-handwriting best guess, an inferred missing word, a short clarification — goes inline exactly where it belongs, colored purple (same span/`\textcolor` split as above). It should read naturally in place while being visually distinct from the true transcription. Do not use `> [!note] AI` callouts or `[unclear: …]` markers.
- **Rendering constraints (Obsidian breaks otherwise):**
  - Never put `$…$` math or markdown syntax (`**`, `*`, `==`) inside an HTML tag — it renders as raw text. Inside a span use HTML tags (`<b>`, `<i>`) and Unicode math symbols (r̄₁₂, F̄ᵢ, ∑, ≠, ², ⋮) instead of LaTeX.
  - A line that is mostly math with colored ink goes entirely in math mode with `\textcolor{…}{…}`, not in a span.
  - Always `\textcolor{color}{…}`, never the `{\color{color} …}` switch form.
  - A highlight that must contain an HTML tag uses `<mark>…</mark>` (colored: `<mark style="background:#aecbfa">`), not `==…==`.
- **Avoid square brackets.** `[...]` renders as raw LaTeX in this vault — never use bracketed markers or bracketed descriptions. Wikilinks `[[…]]` and embeds `![[…]]` are fine; math `\left[ … \right]` that the author actually wrote is fine.
- **Possible source errors.** Never silently correct the author's math — transcribe exactly as written. Do NOT add explanatory flag paragraphs in the body; at most mark a best-guess reading with a single purple symbol/word inline (e.g. an ambiguous summation limit rendered as `\textcolor{purple}{N}`). Full details of every suspected source error go in the chat report only (step 7) — never into the note files.
- **Asides in boxes.** Anything that reads as an aside — a margin reminder, a to-do, a tangential remark disconnected from the derivation flow — goes in an `> [!aside]` callout box (Obsidian titles it "Aside" automatically).
- Inline math `$...$`, display math `$$...$$` on its own lines. Preserve the author's logical sequence; add no derivation steps or facts outside purple text.

## Diagrams

For **every** diagram, figure, graph, or sketch: draw a clean SVG by hand (Write tool) instead of describing it in words or using image generation.

1. Textbook style: white background `<rect>`, black line art for axes/masses/curves, strokes colored to match the ink of the original drawing, `<marker>` arrowheads, italic serif labels (`font-family="'STIX Two Math','Cambria Math','Times New Roman',serif"`).
2. Labels use Unicode overbars (r̄, F̄ via combining U+0304) with `<tspan dy="…" font-size="70%">` subscripts — reproduce every label from the original exactly.
3. Keep the original's rough geometry (relative positions of bodies, arrow directions); shorten arrows so heads stop just outside mass dots.
4. Save to `<course>/refined notes/diagrams/YYYY-MM-DD fig<n>.svg` and embed at the diagram's position with `![[YYYY-MM-DD fig<n>.svg]]`.

## Procedure

1. **Find the target PDF.** The newest file in `rough notes/` with no matching file in `refined notes/`, unless the user names one. If nothing is unprocessed, say so and stop.

2. **Transcribe faithfully** per the formatting rules above. Read the PDF (use the `pages` parameter in chunks if it exceeds 10 pages), noting ink color of every annotation. Transcribe all prose, equations, labels, arrows, and side notes in original order.

3. **Draw diagrams** as SVGs per the Diagrams section.

4. **Cross-check.** Dispatch a fresh subagent that reads the PDF and the draft transcription independently and verifies equation-by-equation: misread symbols, sign errors, dropped terms, dimensional sanity, mislabeled diagrams. Apply fixes for confirmed *transcription* errors; leave suspected *source* errors as written. Do NOT write the findings into the note files — no `## Cross-check findings` section anywhere; the findings are reported only in the chat summary (step 7).

5. **Write the per-day file** to `refined notes/YYYY-MM-DD refined notes.md`:

   ```markdown
   ---
   note_type: refined-lecture
   course: "AE6353"
   lecture_date: YYYY-MM-DD
   source_pdf: "[[M-D-YYYY rough notes.pdf]]"
   tags: [gt, notes/refined]
   ---

   # <Course code> — Lecture YYYY-MM-DD

   <transcription>
   ```

6. **Append to the running document.** Create `<course code> - Running Notes.md` on first run (frontmatter: `note_type: running-notes`, `course`). Append the per-day file's body (everything below its frontmatter) under a `# YYYY-MM-DD` heading at the bottom. Never edit earlier entries.

7. **Report** a one-paragraph summary plus every possible-source-error flag and cross-check finding, so the user can review flagged items. The chat report is the ONLY place cross-check findings appear.

## Common mistakes

- Correcting the user's math silently — transcribe as written and report the discrepancy in the chat summary.
- Adding "possible source error" paragraphs to the body — the user doesn't want them; details belong in the chat report only.
- Writing a `## Cross-check findings` section into the per-day file or running document — that section was retired; findings go in the chat report only.
- Adding unmarked explanatory text — every AI addition is purple (or lives in the chat report).
- Using `## Page N` headings, page markers, or mentioning continuation arrows.
- Using square-bracket markers like `[unclear: …]` or `[Diagram: …]` — brackets render as raw LaTeX here.
- Putting `$…$` math or markdown syntax inside an HTML span — it won't render; use Unicode math or `\textcolor` math mode.
- Describing a diagram in words instead of drawing an SVG.
- Re-processing a PDF that already has a refined file (check first).
- Overwriting instead of appending to the running document.
