Create one polished Obsidian topic note from the supplied materials.

INPUTS
1. The original handwritten PDF, when available.
2. A faithful LaTeX transcription of that PDF.
3. The Obsidian topic-note template.
4. A `VAULT INDEX` containing the exact filenames and aliases of existing notes.

PRIMARY GOAL
Produce a rigorous, readable topic note that preserves the lecture content, reconstructs the derivation step by step, fills genuine understanding gaps, and connects the topic to the existing Obsidian knowledge graph.

RULES

1. Return only the completed Markdown note. Do not wrap the entire response in an extra code fence.
2. Follow the supplied template's section order and property names.
3. Replace all placeholders and remove all instructional comments that are not intentionally part of the finished note.
4. Keep `## Faithful lecture transcription` limited to material present in the handwritten source.
5. Put material not explicitly present in the source under `## AI-added clarification`, or clearly label it at the exact point where it is introduced.
6. Never hide uncertainty. Mark illegible text, uncertain notation, questionable signs, and reconstructed steps explicitly.
7. Use `$...$` for inline math and `$$...$$` for display math.
8. Define every symbol, index, coordinate frame, sign convention, boundary condition, and assumption before relying on it.
9. For every derivation step, explain:
   - the starting equation,
   - the mathematical operation or physical principle used,
   - assumptions introduced at that step,
   - why the step is valid,
   - and what the resulting expression means.
10. Check dimensional consistency, limiting cases, signs, normals, coordinate directions, and physical plausibility.
11. Give important displayed equations short semantic Obsidian block IDs on a separate line, such as:
    `^eq-cauchy-momentum`
    or
    `^eq-surface-force`
12. Link to an equation block using:
    `[[Exact Note Filename#^exact-block-id|descriptive text]]`
13. Link to headings using:
    `[[Exact Note Filename#Exact Heading|descriptive text]]`
14. Link to whole notes using:
    `[[Exact Note Filename|natural display text]]`
15. Only treat a note as existing when its exact filename or alias appears in the supplied `VAULT INDEX`.
16. Do not invent existing links. When a useful note does not exist, propose it using the naming scheme below and add `<!-- proposed -->` after the link.
17. Use these filenames for proposed notes:
    - `T - Topic name`
    - `E - Equation name`
    - `C - Concept name`
    - `D - Derivation name`
18. Keep equations inside the topic note unless they are broadly reusable. Propose a separate `E -` note only for an equation likely to be referenced from multiple topic notes.
19. Distinguish a derivation from a proof when appropriate; do not call a physical or approximate derivation a formal proof.
20. Use authoritative references for added material when browsing or sources are available. Do not fabricate citations, textbook sections, DOIs, page numbers, or URLs.
21. The final note should be self-contained enough that a technically prepared student can understand it without reopening the handwritten PDF, while remaining explicit about which material came from AI reconstruction.

VAULT INDEX
[Paste the current list of exact Obsidian filenames and aliases here.]

TEMPLATE
[Paste the topic-note template here.]

TRANSCRIPTION
[Paste the faithful LaTeX transcription here.]