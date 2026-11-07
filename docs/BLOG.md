# I Built a Three-Agent Content Studio Inside Team Chat

## The idea

Switch lets a room contain people and AI coding agents, with shared context and
visible hand-offs. I used it to build a Content Studio Room for creating a
60-second Hinglish short-video script.

The room has three jobs: research key points, draft the script, and review it
for accuracy, length, and tone. A human owns the final approval gate.

## Setup

1. Install and run Switch Console.
2. Start the local Switch server.
3. Configure Claude Code as the provider.
4. Connect Discord.
5. Create a room from `switch/content-studio.template.yaml`.
6. Add a Discord channel as the room bridge.

The template creates three Claude Code-backed agents in their own directories
and places them in one room. It does not need an extra webhook server.

## Why Switch matters

Switch gives each agent a stable identity and room context, and keeps the
conversation in the same channel the human already uses. The agents can address
one another by name, so the workflow stays visible and the work remains on a
shared page.

The hand-off pattern is the product:

research -> script -> review -> revision loop -> human approval

Without Switch, this would usually become separate API calls, a custom chat
bridge, and invisible orchestration. Switch supplies the room, agent identities,
threaded conversation, bridge, and coordination surface.

## What I learned

Use room instructions for shared rules and agent instructions for each role.
Keep addresses explicit, require the reviewer to send concrete fixes, and
reserve final approval for the human. Build the smallest loop that demonstrates
the collaboration rather than adding many tools or agents.
