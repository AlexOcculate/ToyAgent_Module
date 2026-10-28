🧸 I'm happy to share ToyAgent v0.0.1 so you can take agentic AI apart — and put it back together.

Free & open-source collection of small "toy" projects in Python. Each one isolates a single agentic concept, so you can study the moving parts without the noise of a heavy framework.

⭕ No API keys. ⭕ No pip install. ⭕ No LLM. <--- ❗❗❗

The idea is simple: one project = one concept. No magic, no black boxes — just readable code you can run, break, and rebuild.

What's in this first release (11 modules):

- #0 ToyAgentNoBrain — the full agent harness (loop, tools, memory, context, recovery, guardrails) with a simulated "brain." Swap the brain, keep the body.
	- 👉 https://github.com/AlexOcculate/ToyAgentNoBrain

- #1 ToyA2A — two agents communicating over an in-memory message bus, with delegation.
	- 👉 https://github.com/AlexOcculate/ToyA2A

- #2 ToyMCP — external tool discovery via JSON-RPC (`initialize`, `tools/list`, `tools/call`).
	- 👉 https://github.com/AlexOcculate/ToyMCP

- #3 ToyBrain — what actually happens at the wire level: headers, JSON, status codes, token counts, latency.
	- 👉 https://github.com/AlexOcculate/ToyBrain

- #4 ToyPlanner — decompose a goal into subtasks, then execute each in sequence.
	- 👉 https://github.com/AlexOcculate/ToyBrain
  
- #5 ToyEmbeddings — text → vectors, plus cosine similarity. No GPU, no model, no API.
	- 👉 https://github.com/AlexOcculate/ToyEmbeddings
  
- #6 ToyVectorDB — store vectors and search by nearest neighbor.
	- 👉 https://github.com/AlexOcculate/ToyVectorDB
    
- #7 ToyRAG — retrieve relevant context, inject it into the prompt, answer with citations.
	- 👉 https://github.com/AlexOcculate/ToyRAG
  
- #8 ToySandBox — run tools in a restricted environment with limits and audit logging.
	- 👉 https://github.com/AlexOcculate/ToySandBox
    
- #9 ToyEvaluator — automated tests that score how an agent behaves.
	- 👉 https://github.com/AlexOcculate/ToyEvaluator

- #10 ToyCapstone — MCP + Planner + RAG + SandBox + Evaluator, wired into one system.
	- 👉 https://github.com/AlexOcculate/ToyCapstone

The through-line: Learn the architecture. Jailbreak the logic. Feel the dopamine.

A few honest notes: this is a live project — v0.0.1 is the foundation, and it will grow over time with new features and more toy projects as the curriculum expands. It's intentionally small and readable, not a production framework. But everything you need to understand _how_ agents work under the hood is here, in plain Python.

It's free and open source on GitHub. Fork it, trace the loops, swap in your own model, and build on top of it.

👉 Explore the collection: [https://github.com/AlexOcculate](https://github.com/AlexOcculate) Start at #0 (the harness) or jump to #10 (the capstone).

If you find this useful, a star helps others discover it. And if there's a concept you'd like to see isolated next, tell me in the comments — that's exactly how the roadmap gets built.
