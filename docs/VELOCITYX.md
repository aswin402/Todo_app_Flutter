# ⚡ Rapid UI Development with VelocityX

[VelocityX](https://pub.dev/packages/velocity_x) is used throughout the project to speed up UI development and maintain a clean code structure.

## 🚀 Core Concepts

VelocityX replaces long, nested Flutter widget trees with concise, chainable extension methods.

### 📝 Shorthand Styles
Instead of:
```dart
Text(
  "Todo Title",
  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
)
```
We use:
```dart
"Todo Title".text.xl.bold.make()
```

### 📦 Layout Helpers
We use `VStack` and `HStack` for vertical and horizontal layouts, along with shorthand padding and margin:
- `VStack([child1, child2]).p16()`
- `8.widthBox` or `16.heightBox` for spacing.

### 🎨 Color & Box Decoration
VelocityX provides powerful box helpers:
```dart
widget.box.rounded.color(context.cardColor).shadowSm.make()
```

## 🛠️ Usage in Project

- **TaskTile**: Uses `HStack` and `VStack` for complex item layouts.
- **TaskView**: Leverages `VStack` and padding helpers for form alignment.
- **HomePage**: Uses `centered()` and `expand()` for efficient space management.
