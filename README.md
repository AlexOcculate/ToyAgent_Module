🧸 ToyAgent v0.0.1 "Spring 2026 DownUnder"

"...so you can take agentic AI apart — and put it back together..."

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

# MODULE SPECIFICATIONS:

## 0 ToyAgentNoBrain: 
- URL: https://github.com/AlexOcculate/ToyAgentNoBrain
- Concept: Isolate the agent harness (loop, tools, memory, context, recovery, guardrails) from the LLM.
- New component: The full harness as 7 files in Harness/.
- SimulatedLM: Keyword matching for add, subtract, memory_store, memory_recall, memory_list.
- Key insight: Swap the brain, keep the body. One file change = new model.

## 1 ToyA2A: 
- URL: https://github.com/AlexOcculate/ToyA2A
- Concept: Two agents communicate via an in-memory message bus. One delegates to the other.
- New component: Message envelope + MessageBus + Dispatcher (non-blocking delegation).
- SimulatedLM: Each agent has a domain (math / memory) and a delegate rule for out-of-domain tasks.
- Key insight: Multi-agent = message passing + a delegation decision. No framework needed.

## 2 ToyMCP: 
- URL: https://github.com/AlexOcculate/ToyMCP
- Concept: Agent discovers tools externally via JSON-RPC protocol (initialize, tools/list, tools/call).
- New component: Protocol layer (jsonrpc.py) + Server (hosts tools) + Client (discovers and routes).
- SimulatedLM: Adapts to discovered tool names at runtime.
- Key insight: MCP separates "who defines tools" from "who uses tools." Add a server = new capabilities, zero agent code change.

## 3 ToyBrain: 
- url = https://github.com/AlexOcculate/ToyBrain
- Concept: Show what happens at the wire level (HTTP headers, JSON body, status codes, token counts, latency).
- New component: Interceptor (proxy that logs every request/response) + MockBackend (simulated API) + LiveBackend (real urllib call, optional).
- Key insight: lm.generate() is really an HTTPS POST. The interceptor sits on the boundary between your code and the model provider.

## 4 ToyPlanner: 
- URL: https://github.com/AlexOcculate/ToyPlanner
- Concept: Decompose a complex goal into subtasks, then execute each sequentially.
- New component: Planner (decomposition) + TaskTracker (status tracking: pending/in_progress/done/failed).
- Three phases: PLAN → EXECUTE (loop over subtasks) → REPORT.
- Key insight: Reactive agent = one loop. Planning agent = decompose first, then execute. Higher-level loop contains lower-level loop.

## 5 ToyEmbeddings: 
- URL: https://github.com/AlexOcculate/ToyEmbeddings
- Concept: Convert text into numeric vectors where similar texts have similar vectors.
- New component: EmbeddingEngine (bag-of-words / TF-IDF) + CosineSimilarity function.
- No agent loop. Pure data transformation + similarity measurement.
- Key insight: An embedding is just a list of numbers. Similarity is just a dot product normalized by magnitudes. No GPU, no model, no API.

## 6 ToyVectorDB: 
- URL: https://github.com/AlexOcculate/ToyVectorDB
- Concept: Store vectors and search by similarity (nearest neighbor).
- New component: VectorStore (insert, search top-K, delete) using lists + cosine similarity from #5 pattern.
- No agent loop. Pure data structure + query interface.
- Key insight: A vector database is a list of vectors + a similarity function + sorting. Pinecone/Weaviate add indexing for scale. The concept is identical.

## 7 ToyRAG: 
- URL: https://github.com/AlexOcculate/ToyRAG
- Concept: Retrieve relevant documents, inject into context, produce grounded answer with citations.
- New component: RAGPipeline (retrieve → augment prompt → generate → cite). Uses keyword search or cosine similarity over a small corpus of text files.
- Agent loop: Same as #0 but the "think" step includes retrieved context.
- Key insight: RAG = search + paste into prompt. The agent loop is unchanged. The quality improvement comes from grounding, not from a smarter model.

## 8 ToySandBox: 
- URL: https://github.com/AlexOcculate/ToySandBox
- Concept: Tools execute in a restricted environment with resource limits and audit logging.
- New component: SandBox (restricted namespace, execution timeout via threading.Timer, output validation, audit trail).
- Agent loop: Same as #0 but tool execution goes through SandBox.execute() instead of direct call.
- Key insight: In production, agent tools run in Docker/WASM. The concept is the same: restrict what code can touch, limit resources, log everything.

## 9 ToyEvaluator:
- URL: https://github.com/AlexOcculate/ToyEvaluator
- Concept: Automated testing of agent behavior — define test cases, run agent, score outputs.
- New component: Evaluator (test case definitions, scoring functions: exact match, keyword presence, tool-call correctness, latency budget).
- Agent loop: No agent loop in this module. It WRAPS an agent and measures it.
- Key insight: You can't trust an agent you haven't tested. Evals catch regressions when you swap models or change prompts.

## 10 ToyCapstone: 
- URL: https://github.com/AlexOcculate/ToyCapstone
- Concept: Combine MCP + Planner + RAG + SandBox + Evaluator into one system.
- New component: CapstoneAgent that uses: 
  - MCP client to discover tools from 2 servers
  - Planner to decompose complex goals
  - RAG pipeline to ground answers in a document corpus
  - SandBox to execute tools safely
  - Evaluator to self-score after each run
- Key insight: All previous concepts compose. No new patterns — just wiring. 
  
> If you find this useful, a star helps others discover it. And if there's a concept you'd like to see isolated next, tell me in the comments — that's exactly how the roadmap gets built.
