# Revision History

## 1.4.0 - 2026-11-09
- Improved `Invoke-AIDiagnostics -PassThru -JSonOutput` so `Diagnosis.Collection` is normalized to JSON objects when provider output is valid JSON.
- Added `ConvertTo-NitrogenDiagnosisJson` to parse provider responses and preserve non-JSON responses as `{ "rawText": "..." }`.
- Updated the module default diagnostics prompt to require JSON-only output (no markdown/prose) with the expected finding schema.
- Updated `Initialize-NitrogenConfig` default `PromptText` to use the JSON-only diagnostics contract.
- Updated docs/README to reflect JSON diagnosis normalization and the stricter JSON output prompt guidance.

## 1.3.0 - 2026-10-17
- Added `Ollama` provider for on-premises / local models (`-Provider Ollama`).
- Added `Get-OllamaModels` to list models on an Ollama server (`/api/tags`), with caching and `-Refresh`.
- Ollama requests send the diagnostics JSON inline (no file upload API) via `/api/chat`, with configurable `numCtx`, `maxTokens`, `timeoutSec`, `keepAlive` and `format`.
- Config validation now permits `http://` endpoints for the Ollama provider only. All other providers still require `https`.
- API key is optional for Ollama (`OLLAMA_API_KEY` or `apiKeyRef`, only needed behind an authenticating proxy).
- `Initialize-NitrogenConfig` now includes a starter `Ollama` provider block.

## 1.2.0 - 2026-10-17
- Added `Get-AnthropicModels` to retrieve available Anthropic models.
- Enhanced `Get-GeminiModels` output to include expanded model metadata fields.
- Added `-Refresh` support to `Get-OpenAIModels` for cache bypass and model list refresh.
- Added `-Refresh` support to `Get-PerplexityModels` for cache bypass and model list refresh.
- Updated module manifest exports/version for 1.2.0.

## 1.1.0 - 2026-10-11
- Added configuration storage/retrieval features
- Merged diagnostic data with AI response in -PassThru output
- Added Get-NitrogenConfig
- Added Set-NitrogenPrompt
- Added Initialize-NitrogetConfig

## 1.0 - 2026-10-10
- Initial release