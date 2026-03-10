# Perspective Studio

Your LLM playground on Apple devices.

Perspective Studio is a free, open-source macOS app for running open-source AI models locally on your Mac. No cloud. No API keys. No subscriptions. Just you and the model, running on Apple Silicon.

Built with SwiftUI and [MLX Swift](https://github.com/ml-explore/mlx-swift-lm) by [Techopolis](https://github.com/Techopolis).

## Features

- **Model Discovery** — Browse thousands of models from the [mlx-community](https://huggingface.co/mlx-community) on Hugging Face, organized into categories like Chat, Reasoning, Code, Vision, and more
- **One-Click Download** — Download any model directly to your Mac with progress tracking
- **Local Inference** — Chat with models entirely on-device using MLX Swift. Nothing leaves your machine
- **RAM Awareness** — See at a glance which models fit comfortably in your Mac's memory
- **TTS Playground** — Text-to-speech with MLX Audio and VibeVoice models
- **Context Management** — Automatic conversation summarization to stay within context limits
- **Beginner Friendly** — A simplified experience mode that hides technical jargon and shows practical descriptions
- **Accessible from the Ground Up** — Full VoiceOver support, keyboard navigation, accessibility announcements, and screen reader-friendly UI throughout. Built by a blind developer who uses VoiceOver as the primary interface

## Requirements

- macOS 26 or later
- Apple Silicon Mac (M1 or later)
- Xcode 26 (to build from source)

## Getting Started

1. Clone the repository:
   ```
   git clone https://github.com/Techopolis/Perspective-Studio.git
   ```
2. Open `perspective studio.xcodeproj` in Xcode
3. Build and run (Cmd+R)
4. Pick a model from the Discover tab and start chatting

## Built With

- [MLX Swift](https://github.com/ml-explore/mlx-swift) — Apple's machine learning framework for Apple Silicon
- [MLX Swift LM](https://github.com/ml-explore/mlx-swift-lm) — Language model inference
- [Swift Transformers](https://github.com/huggingface/swift-transformers) — Tokenizers from Hugging Face
- [Hugging Face Hub](https://huggingface.co/mlx-community) — Model discovery and downloads

## Accessibility

Perspective Studio is built with accessibility as a core requirement, not an afterthought. The primary developer is blind and uses VoiceOver daily.

Every interactive element has proper accessibility labels and hints. Every state change is announced. Every feature is keyboard navigable. If you find an accessibility issue, please report it using our [accessibility issue template](https://github.com/Techopolis/Perspective-Studio/issues/new?template=accessibility.yml).

## Contributing

Contributions are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

All UI contributions must be tested with VoiceOver. This is not optional.

## License

MIT. See [LICENSE](LICENSE) for details.

## Related Projects

- [Perspective Server](https://github.com/Techopolis/Perspective-Server) — macOS menu bar app that exposes on-device Foundation Models as an OpenAI-compatible local API
- [Perspective CLI](https://github.com/Techopolis/PerspectiveCLI) — Command-line interface for running Foundation Models and MLX models
- [Perspective Web](https://github.com/Techopolis/perspective-intelligence-web-community) — Open-source AI chat app powered by Apple Foundation Models, runs in any browser
