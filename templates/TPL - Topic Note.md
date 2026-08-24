<%*
const topicInput = await tp.system.prompt("Topic name", "Untitled Topic");
const courseInput = await tp.system.prompt("Course code", "AE XXXX");
const dateInput = await tp.system.prompt("Lecture date", tp.date.now("YYYY-MM-DD"));
const pdfInput = await tp.system.prompt("Source PDF filename, including .pdf (optional)", "");

const topic = (topicInput || "Untitled Topic").trim();
const course = (courseInput || "AE XXXX").trim();
const lectureDate = (dateInput || tp.date.now("YYYY-MM-DD")).trim();
const sourcePdf = (pdfInput || "").trim();

const safeTopic = topic
  .replace(/[\\/:*?"<>|#^\[\]]/g, "")
  .replace(/\s+/g, " ")
  .trim();

await tp.file.rename(`T - ${safeTopic}`);
-%>
---
note_type: topic
aliases:
  - "<% topic.replace(/"/g, '\\"') %>"
course: "<% course.replace(/"/g, '\\"') %>"
lecture_date: <% lectureDate %>
created: <% tp.date.now("YYYY-MM-DD") %>
status: draft
source_pdf: "<% sourcePdf ? `[[${sourcePdf}]]` : "" %>"
tags:
  - gt
  - knowledge/topic
---

# <% topic %>

> [!abstract] Core idea
> State the central result in 2–4 sentences: what is being explained or derived, the final conclusion, and why it matters.

**Course:** [[<% course %> - Course Hub]]  
**Lecture date:** <% lectureDate %>  
<% sourcePdf ? `**Source PDF:** [[${sourcePdf}]]` : "" %>

## Learning objectives

After reviewing this note, I should be able to:

- [ ] State the main result.
- [ ] Explain the physical or mathematical meaning.
- [ ] Reproduce the derivation without looking.
- [ ] Identify the assumptions and limits of validity.
- [ ] Connect the result to the related equations and concepts.

## Faithful lecture transcription

> [!note] Provenance
> Keep this section faithful to the handwritten notes. Correct obvious transcription mistakes, but do not silently add new theory here. Mark uncertain text as **[unclear]**.

[Insert the cleaned transcription of the handwritten notes.]

## Prerequisites

- [[C - Prerequisite concept]]
- [[E - Prerequisite equation]]
- [[T - Earlier topic]]

## Notation and conventions

| Symbol | Meaning | Units or type | Sign/frame convention | Related note |
|---|---|---|---|---|
| $x$ | [Definition] | [Units] | [Convention] | [[C - Related concept]] |

## Assumptions and domain of validity

- **Assumption 1:** [State it and explain why it is used.]
- **Assumption 2:** [State it and explain what would change if it failed.]
- **Coordinate system:** [Define axes, orientation, and positive directions.]
- **Boundary/initial conditions:** [State them explicitly.]
- **Valid when:** [Regime, approximations, and constraints.]
- **Not valid when:** [Important failure cases.]

## Governing equations

### [Equation name]

$$
\text{Insert equation here}
$$

^eq-semantic-name

**Meaning:** [Explain every term in words.]  
**Assumptions:** [List assumptions specific to this equation.]  
**Dimensions/units:** [Check dimensional consistency.]  
**Related note:** [[E - Equation name]]

> Use short, human-readable block IDs such as `^eq-cauchy-momentum` so other notes can link directly to the equation with `[[T - Note Name#^eq-cauchy-momentum]]`.

## Derivation or proof

> [!important] Goal
> Clearly state what is being derived and the desired final expression.

### Step 0 — Define the problem

**Starting point:** [[E - Starting equation]] or [[T - Related topic#^eq-existing-result]]

[Explain the geometry, control volume, coordinate system, variables, and known conditions.]

### Step 1 — [Describe the operation]

$$
\text{Equation for this step}
$$

**Why this step is valid:** [Explain the identity, theorem, approximation, or physical principle used.]  
**Assumptions introduced:** [List any newly introduced assumptions.]  
**Connection:** [[C - Relevant concept]]

### Step 2 — [Describe the operation]

$$
\text{Equation for this step}
$$

**Why this step is valid:** [Explanation.]  
**Common point of confusion:** [Clarify a sign, frame, derivative, tensor operation, or boundary term.]

### Final result

$$
\boxed{\text{Final result}}
$$

^eq-final-result

**Interpretation:** [Explain what the result says physically and mathematically.]  
**Dependencies:** [[E - Supporting equation]], [[C - Supporting concept]]  
**Leads to:** [[T - Next topic]] or [[D - Related derivation]]

## Physical interpretation

- **In plain language:** [Explain without relying on equations.]
- **Geometric meaning:** [Explain vectors, surfaces, directions, or fields.]
- **Cause and effect:** [What changes when each important variable changes?]
- **Limiting cases:** [Check simple or extreme cases.]
- **Engineering use:** [Where this appears in analysis, design, simulation, or experiments.]

## Worked example

### Problem

[State a compact example that exercises the main idea.]

### Solution

$$
\text{Work through the example step by step}
$$

### Result and interpretation

[Explain whether the magnitude, sign, and units are reasonable.]

## AI-added clarification

> [!warning] Verify this material
> This section contains context that was not explicitly present in the handwritten notes. Verify important claims, sign conventions, and equations against the textbook, instructor material, or another authoritative source.

- [Missing intermediate step supplied by AI.]
- [Background concept needed to understand the derivation.]
- [Alternative interpretation or useful analogy.]
- [Connection to a later topic.]

## Common mistakes

- [Mistake involving signs, coordinates, or normals.]
- [Mistake involving partial versus material derivatives.]
- [Mistake involving assumptions or boundary conditions.]
- [Mistake involving units or tensor/vector notation.]

## Verification checks

- [ ] Every symbol is defined before use.
- [ ] The equations match the handwritten PDF.
- [ ] Units are dimensionally consistent.
- [ ] Coordinate and sign conventions are explicit.
- [ ] Boundary and initial conditions are stated.
- [ ] Important limiting cases behave correctly.
- [ ] AI-added claims have been verified.
- [ ] Internal links resolve to the intended notes.

## Connections

### Equations used

- [[E - Equation name]]
- [[T - Related topic#^eq-semantic-name]]

### Concepts used

- [[C - Concept name]]

### Results derived here

- [[E - Derived result]]
- [[D - Related derivation]]

### Applications and later topics

- [[T - Application topic]]

### Proposed new notes

- [[E - New equation]] <!-- proposed: create only if this result will be reused -->
- [[C - New concept]] <!-- proposed -->
- [[D - New derivation]] <!-- proposed -->

## Open questions

- [ ] [Question to ask in class or resolve from the textbook.]
- [ ] [Step that still needs verification.]
- [ ] [Connection that is not yet clear.]

## References

1. <% sourcePdf ? `[[${sourcePdf}]]` : "[[Source lecture PDF]]" %>
2. [Authoritative textbook, lecture note, or paper]
3. [Additional source used for AI-added clarification]
