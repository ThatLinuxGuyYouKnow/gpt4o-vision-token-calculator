# GPT4 Vision Token Calculator 🖼️

[![Flutter](https://img.shields.io/badge/Flutter-3.0.0-blue.svg)](https://flutter.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Web-orange.svg)]()

A web-based tool to calculate the number of tokens that would be used when sending images to GPT-4 Vision. This helps developers estimate costs and optimize their image inputs before making API calls.

## Features 🚀

- Upload images and instantly calculate token usage
- Automatic image dimension scaling following OpenAI's specifications
- Real-time token cost estimation
- User-friendly interface
- Web-based for easy access

## How It Works 🛠️

The calculator follows OpenAI's official token calculation process:

1. Images are first scaled to fit within a 2048x2048 square while maintaining aspect ratio
2. The shortest side is then scaled to 768px if it exceeds this limit
3. The image is divided into 512x512 tiles
4. Token calculation: 85 (base) + 170 * (number of tiles)

## Usage 💻

1. Visit the web application
2. Click on the upload area or drag and drop your image
3. The calculator will automatically process your image and display:
   - Final scaled dimensions
   - Number of 512x512 tiles needed
   - Total token count

## Installation 📦

To run locally:

```bash
# Get dependencies
flutter pub get

# Run for web
flutter run -d chrome
```

## Contributing 🤝

Contributions are welcome! Please feel free to submit a Pull Request.

## License 📄

This project is licensed under the MIT License 

## Acknowledgments 👏

- Based on OpenAI's [official token calculation method](https://platform.openai.com/docs/guides/vision/calculating-costs)
- Inspired by the community discussion on [OpenAI forums](https://community.openai.com/t/how-do-i-calculate-image-tokens-in-gpt4-vision/492318/2)