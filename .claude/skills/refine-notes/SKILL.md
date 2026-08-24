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
| `<course>/rough notes/M-D-YYYY rough.pdf` | Input — handwritten iPad PDFs |
| `<course>/refined notes/YYYY-MM-DD refined.md` | Output — one file per rough PDF |
| `<course>/<course code> - Running Notes.md` | Running document, newest appended at the bottom |

## Procedure

1. **Find the target PDF.** The newest file in `rough notes/` with no matching file in `refined notes/`, unless the user names one. If nothing is unprocessed, say so and stop.

2. **Transcribe faithfully.** Read the PDF (use the `pages` parameter in chunks if it exceeds 10 pages). Rules:
   - Transcribe all prose, equations, labels, arrows, annotations, and side notes in original page order under `## Page N` headings.
   - Inline math as `$...$`, display math as `$$...$$` on its own lines.
   - Preserve the author's logical sequence even when incomplete. Do not add derivation steps, definitions, or facts.
   - Never silently correct a potentially substantive math error — transcribe as written and append `**[possible source error]**`.
   - Unclear handwriting: `[unclear: best interpretation]`. Never guess without marking it.
   - Diagrams: compact bracketed description, e.g. `[Diagram: ellipse with focus F, labels a, b, r]`, transcribing every visible label.

3. **Light cleanup.** Fix only non-substantive issues (spacing, unmistakable symbol formatting). Where a short clarification genuinely helps, add it as a `> [!note] AI` callout — never woven into the transcription text unmarked.

4. **Cross-check.** Dispatch a fresh subagent that reads the PDF and the draft transcription independently and verifies equation-by-equation: misread symbols, sign errors, dropped terms, dimensional sanity, mislabeled diagrams. Put its findings in a `## Cross-check findings` section at the end of the file (or "No discrepancies found."). Apply fixes for confirmed *transcription* errors; leave suspected *source* errors flagged, not fixed.

5. **Write the per-day file** to `refined notes/YYYY-MM-DD refined.md`:

   ```markdown
   ---
   note_type: refined-lecture
   course: "AE6353"
   lecture_date: YYYY-MM-DD
   source_pdf: "[[M-D-YYYY rough.pdf]]"
   tags: [gt, notes/refined]
   ---

   # <Course code> — Lecture YYYY-MM-DD

   <transcription with cleanup callouts>

   ## Cross-check findings
   ```

6. **Append to the running document.** Create `<course code> - Running Notes.md` on first run (frontmatter: `note_type: running-notes`, `course`). Append the per-day file's body (everything below its frontmatter) under a `# YYYY-MM-DD` heading at the bottom. Never edit earlier entries.

7. **Report** a one-paragraph summary plus every `[possible source error]` and cross-check finding, so the user can review flagged items.

## Common mistakes

- Correcting the user's math silently — flag it, don't fix it.
- Adding unmarked explanatory text — all additions live in `> [!note] AI` callouts or the cross-check section.
- Re-processing a PDF that already has a refined file (check first).
- Overwriting instead of appending to the running document.
