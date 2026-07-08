# 👻 AFK Gremlin

> A tiny Claude Code plugin that generates funny, work-safe Slack AFK/BRB messages — for errands, appointments, life admin, and the occasional real-life side quest.

A little gremlin drags you away from your desk and leaves a tidy note for your team. Give it a duration and a vibe; it hands you three ready-to-paste Slack messages, from *safe-and-professional* to *lovably chaotic*.

<p align="center">
  <img src="demo/afk-gremlin.gif" alt="AFK Gremlin demo" width="720">
</p>

```
You:  /afk-gremlin 2 hours, errands, funny

👻:   1. Hey team, stepping out to knock out some errands — AFK ~2 hours, back soon.
      2. Off to fight the errands boss level. AFK for about 2 hours.
      3. A real-life side quest just spawned. AFK ~2 hours; back once the quest is complete. 🗡️
```

## Install

In Claude Code:

```
/plugin marketplace add doinglivingtest/afk-gremlin
/plugin install afk-gremlin@doinglivingtest
```

That's it. The `afk-gremlin` skill is now available in every session.

## Usage

Just describe how long you'll be gone and (optionally) why or in what tone:

```
/afk-gremlin
/afk-gremlin 30 min, appointment
/afk-gremlin 1 hour, mom airport, dry
/afk-gremlin rest of the day, honest-vague, corporate
/afk-gremlin surprise me, very chaotic
```

Or just talk to Claude naturally — *"write me an AFK message, I'm gone for lunch for an hour"* — and the skill kicks in automatically.

By default you get **3 options** escalating in energy (safe → funny → chaotic). Ask for one if that's all you want.

### Inputs

| Input | Values | Default |
| --- | --- | --- |
| `duration` | 30 minutes, 1 hour, 2 hours, rest of the day, "a bit" | `a bit` |
| `reason_type` | errands, family, appointment, delivery, home-chaos, lunch, commute, random, honest-vague | `honest-vague` |
| `tone` | normal, friendly, funny, dry, corporate, chaotic, very-chaotic | `friendly-funny` |
| `channel` | team, manager, standup, DM, public channel | `team` |
| `include_eta` | yes / no | `yes` |
| `language` | English, Spanish | `English` |

## Sending to Slack

The skill generates text — copy/paste is the zero-setup default. To have Claude post it for you, use either:

- **A Slack MCP connector** — if you have one configured, ask Claude to post the option you like to a channel or set your status.
- **An incoming webhook:**
  ```bash
  export SLACK_WEBHOOK_URL="https://hooks.slack.com/services/XXX/YYY/ZZZ"
  curl -X POST -H 'Content-type: application/json' \
    --data '{"text":"Off to fight the errands boss level. AFK ~2h."}' \
    "$SLACK_WEBHOOK_URL"
  ```

Claude will always confirm the destination channel before posting anything.

## Ground rules (the un-sketchy part)

AFK Gremlin is built to keep you *out* of trouble, not in it. It **won't** invent fake medical emergencies, family crises, legal problems, accidents, or deaths. It leans on vague, honest, harmless wording — the kind of message a real coworker actually sends. Keep it light, keep it believable, keep HR asleep.

## Contributing

PRs welcome — new tones, reason types, and (tasteful) jokes especially. Keep messages short, work-safe, and believable. Validate the plugin before opening a PR:

```
claude plugin validate .
```

## License

MIT © Alejandro Tellez — see [LICENSE](LICENSE).
