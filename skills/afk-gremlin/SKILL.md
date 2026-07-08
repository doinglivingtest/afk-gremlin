---
name: afk-gremlin
description: Generate short, funny, work-safe Slack AFK/BRB messages. Use when the user wants to tell their team they'll be away, delayed, stepping out, running errands, at an appointment, or temporarily unavailable. Supports duration, tone, reason type, randomness, and Slack-style formatting.
---

# AFK Gremlin

A little gremlin that drags you away from your desk and leaves a tidy note for your team. Generate quick, Slack-ready AFK messages that are funny, believable, low-drama, and safe to post at work.

## Purpose

Produce away/BRB messages that a coworker could post verbatim. The goal is NOT to fabricate emergencies — prefer vague, honest, or harmless wording.

**Never invent** serious medical issues, family crises, legal problems, accidents, deaths, or emergencies unless the user explicitly says the reason is real.

## Inputs

Ask for or infer these. All are optional — fall back to the defaults.

| Input | Values | Default |
| --- | --- | --- |
| `duration` | 30 minutes, 1 hour, 2 hours, rest of the day, "a bit" | `a bit` |
| `reason_type` | errands, family, appointment, delivery, home-chaos, lunch, commute, random, honest-vague | `honest-vague` |
| `tone` | normal, friendly, funny, dry, corporate, chaotic, very-chaotic | `friendly-funny` |
| `channel` | team, manager, standup, DM, public channel | `team` |
| `include_eta` | yes / no | `yes` |
| `language` | English, Spanish | `English` |

When the user gives a partial request (e.g. "2 hours, errands, funny"), infer the rest and generate — don't interrogate them.

## Safety & style rules

- Keep messages to **1–2 sentences**. Short beats clever.
- Output is **Slack-ready**: no preamble, no explanation unless asked.
- Don't overshare. Don't blame other people.
- No fake serious excuses (medical/legal/family emergencies, deaths, accidents).
- Nothing that creates HR, legal, or medical implications.
- Sound human and casual — like a real coworker typing fast.
- **Funny** mode = light absurdity, still believable.
- **Chaotic** mode = playful but still postable at work.
- When unsure, default to vague: "I need to step away for a bit."

## Output format

By default, output **3 numbered options** escalating in energy:

1. **Safe / professional** — the one you can always post.
2. **Friendly / funny** — a little personality.
3. **Slightly chaotic** — playful, self-aware.

If the user asks for one message, output only one. Match `include_eta` — include a rough "back in ~X" when yes, omit when no. Respect `language`.

## Examples

**User:** 2 hours, errands, funny.

1. Hey team, stepping out to knock out some errands — AFK ~2 hours, I'll catch up when I'm back.
2. Off to fight the errands boss level. AFK for about 2 hours, back soon.
3. A real-life side quest just spawned. AFK ~2 hours; I'll resurface once the quest is complete. 🗡️

**User:** 1 hour, mom airport.

1. Hey team, taking my mom to the airport — AFK ~1 hour, will catch up after.
2. Quick airport run for my mom. Away about an hour, hoping traffic chooses peace today.
3. Mom airport logistics have entered the chat. AFK ~1 hour, wish me green lights.

**User:** random, very chaotic, 30 mins.

1. Hey team, stepping away for ~30 minutes, back shortly.
2. Tiny life-admin fire to extinguish. AFK ~30 minutes, back soon. 🔥
3. Reality scheduled an uninvited side quest. Vanishing for 30 minutes, returning with hopefully no plot twists.

## Sending to Slack (optional)

This skill generates text. To actually *post* it, wire the output to Slack via one of:

- **Slack MCP server** — if a Slack connector/MCP is configured, post the chosen option to a channel or set the user's status.
- **Incoming webhook** — `curl -X POST -H 'Content-type: application/json' --data '{"text":"<message>"}' "$SLACK_WEBHOOK_URL"`
- **Manual** — just copy/paste. Default to this unless the user asks to send it.

Always confirm the destination (which channel) before posting anything to Slack.
