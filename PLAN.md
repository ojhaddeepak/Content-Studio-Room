# Plan: "Content Studio Room" Hackathon Project

## 1. Goal
A Switch "room" where 3 agents (researcher, scripter, reviewer) and a human producer collaborate to create a 60-second Hinglish short-video script.

## 2. File Plan
- `/switch/content-studio.template.yaml`: The Switch template for creating the room, agents, and defining their briefing/kickoff.
- `/agents/`: (Optional/Minimal) No specific code is needed; we will define agents using `instructions` in the template to leverage providers like Claude Code or Codex.
- `README.md`: Project summary, architecture, setup guide, and Switch-central argument.
- `/docs/DEMO_SCRIPT.md`: Demo video plan.
- `/docs/BLOG.md`: Draft blog post.

## 3. Implementation Steps
1.  **Define YAML:** Draft `/switch/content-studio.template.yaml` based on `triage-pair.template.yaml`.
2.  **README/Docs:** Draft the required supporting documentation.
3.  **Setup:** Verify instructions for cloning, installing Console, and running the template.
4.  **Testing (Manual):** User must perform manual tests in Switch Console (creating the room from the template, inviting the Switch app, testing hand-offs).

## 4. Key Considerations
- **Handoffs:** Agents will use explicit naming (mentions) in `post_message` to hand off work.
- **Addressing:** Use `owner-agents` addressing for sub-agents (script, review) to permit the triager/human to talk to them, while keeping the triager's `addressing: anyone`.
- **Reproducibility:** We will keep the setup minimal, relying on built-in providers.

---
Does this file plan look good? Should I proceed with generating these files?
