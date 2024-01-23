#!/bin/bash

# Path to a silent audio file (you can create an empty audio file)
silent_audio="/path/to/silent.wav"

# Number of beeps
num_beeps=5

# Delay between beeps (in seconds)
delay_between_beeps=1

# Play the silent audio file multiple times
for ((i=0; i<$num_beeps; i++)); do
    afplay /System/Library/Sounds/Ping.aiff
    sleep $delay_between_beeps
done
