
```markdown
# Catch Up Game

Catch Up Game is a simple and fun iOS game where players try to "catch" a moving image by tapping it as quickly as possible. This project is designed using **Storyboard** for the user interface and demonstrates the use of gesture recognizers, randomization, and basic game mechanics.

## Features

- Interactive gameplay with tap gestures.
- Randomized image movements for added challenge.
- Score tracking for successful clicks.
- High score saving to track the best performance.
- Timer-based gameplay with an option to replay after the game ends.

## Gameplay

1. Tap on the moving image as quickly as you can to score points.
2. Try to beat your previous high score before the timer runs out.
3. Replay the game as many times as you'd like and keep improving!

## How It Works

1. **Design with Storyboard**:
   - Integrated 9 images into the interface using **Storyboard**.
   - Enabled user interaction for each image.

2. **Gesture Recognizer**:
   - Added a **UITapGestureRecognizer** to detect when the user taps on the image.

3. **Image Visibility**:
   - Initially made all images invisible.
   - Used random number generation to determine which image should appear, giving the illusion of movement.

4. **Scoring System**:
   - Incremented the player's score for each successful tap on the image.

5. **High Score Tracking**:
   - Stored the highest score locally to track the player's best performance.

6. **Timer and Replay**:
   - Implemented a countdown timer for the game duration.
   - Displayed an alert to the player when the timer ended, with options to replay or exit the game.

## Technologies Used

- **Swift**: Core programming language.
- **Storyboard**: For designing the user interface.
- **Gesture Recognizers**: To handle touch interactions.
- **UserDefaults**: For saving and retrieving the high score.

## Requirements

- Xcode 14+ 
- iOS 15+ 
- Swift 5.7+

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your_username/catch-up-game.git
   cd catch-up-game
   ```

2. Open the project in Xcode:
   ```bash
   open CatchUpGame.xcodeproj
   ```

3. Build and run the project on a simulator or physical device.

## Video Demo


https://github.com/user-attachments/assets/5a816eaf-ea29-4614-b701-b75eea8fcdf0



## Future Improvements

- Adding multiple difficulty levels.
- Introducing different themes or characters.
- Enhancing the game with sound effects and animations.
- Online leaderboard for competitive scoring.
