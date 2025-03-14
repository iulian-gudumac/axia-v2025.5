#!/bin/bash

# Update and install required packages
pkg update && pkg upgrade -y
pkg install git cmake clang python ffmpeg -y

# Clone and build whisper.cpp
echo "Installing Whisper..."
git clone https://github.com/ggerganov/whisper.cpp.git
cd whisper.cpp
bash ./models/download-ggml-model.sh medium
make
cd ..

# Install Coqui TTS
echo "Installing Coqui TTS..."
pip install TTS

# Create shortcut commands
echo "alias whisper_run='cd ~/whisper.cpp && ./main -m models/ggml-medium.bin -f '" >> ~/.bashrc
echo "alias tts_run='tts --text '" >> ~/.bashrc
source ~/.bashrc

echo "✅ Setup complete! Use these commands:"
echo "🎤 Speech-to-Text: whisper_run your_audio.wav"
echo "🗣️ Text-to-Speech: tts_run 'Hello, Iulian'"
