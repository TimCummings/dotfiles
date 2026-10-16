---
name: ste
description: Rewrite a block of text in the user's simplified ASD-STE100 style. Use when the user invokes /ste or asks to apply their STE style to some text.
argument-hint: <text to rewrite>
---

Rewrite the text below by the rules in the "Writing style" section of the
user's instructions.

$ARGUMENTS

If no text is given above, rewrite the text that the user identified in
the conversation. If that is not clear, ask for the text.

- Decide if the text is technical or other writing. Apply the rules
  strictly to technical writing and loosely to other writing.
- Keep the meaning. Don't add facts, and don't remove facts.
- Don't change code, identifiers, commands, names, quotes, or links.
- Keep the format: Markdown, line breaks, and structure, unless a list
  or a split sentence makes the text clearer.
- If a sentence is ambiguous, don't guess. Keep it and mark it with a
  short question after the rewrite.

Show only the rewritten text. Then, if they help, add at most three short
notes about changes that the user might not expect.
