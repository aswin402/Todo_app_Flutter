# todo_app
ref https://youtu.be/RQlhC_rDrsc?si=cHyiu2Lj7rfnWisP

# setup 
## install dependencies

flutter pub add hive hive_flutter uuid intl animate_do panara_dialogs lottie ftoast flutter_slider_drawer flutter_cupertino_date_picker_fork

and 

flutter pub add velocity_x flex_color_scheme logger 

1. hive 

What it is:
A lightweight, blazing-fast NoSQL local database for Flutter and Dart.

Primary use:
Store structured data (list of users, settings, objects) locally without SQL. Great for offline apps.

Why use it:
✅ Super fast
✅ No native dependencies
✅ Works perfectly on mobile & desktop

Alternatives:

drift (Moor) — SQL-like database with strong querying features

** sembast** — simple key/value DB

2. hive_flutter

What it is:
Flutter integration helper for Hive.

Primary use:
Provides initialization and reactive listening (so widgets auto-update when Hive data changes).

Why use it over hive alone?
You get Flutter-friendly APIs like ValueListenableBuilder with boxes.

Alternatives:
Same as Hive alternatives — but for reactive integration you’d write custom code.

3. uuid

What it is:
Generates unique IDs (Universally Unique Identifiers).

Primary use:
Give unique IDs to objects — e.g., user IDs, transaction IDs, db keys.

Why use it:
You don’t have to manually create unique strings or rely on timestamps.

Alternatives:

* nanoid — slightly smaller ID size, same idea

* Custom random with crypto

4. intl

What it is:
Internationalization and localization utility from Dart.

Primary use:

* Format dates, numbers, currencies

* Manage translations for different languages

Why use it:
Essential for apps with multilanguage support or localized formatting.

Alternatives:

* flutter_localizations (core Flutter intl support)

* easy_localization (wrapper that simplifies intl usage)

5. animate_do

What it is:
Easy and fun pre-built animations for Flutter widgets.

Primary use:
Add breathing, bounce, fade, slide, etc., animations with zero animation code.

Why use it:
Save time instead of writing manual AnimationController setups.

Alternatives:

* flutter_animate — newer, very flexible

* simple_animations — powerful custom animations

6. panara_dialogs

What it is:
A nice, customizable dialog & alert UI package.

Primary use:
Show alerts, warnings, info, and success dialogs with clean UI.

Why use it:
Better visuals than stock showDialog — fewer lines of code and more styles.

Alternatives:

* awesome_dialog — fancy ready-made dialog styles

* GetX Snackbar/Dialog

7. lottie

What it is:
Plays Lottie animation JSON files (lightweight vector animations from After Effects).

Primary use:
Beautiful animated illustrations for splash screens, buttons, loading, onboarding.

Why use it:
Animations are small in size, smooth, and scalable.

Alternatives:

* rive — more interactive/advanced animations

* flare_flutter — older but still powerful

8. ftoast

What it is:
Flutter toast message utility.

Primary use:
Display quick toast notifications (small popup messages).

Why use it:
Simple, customizable toast without scaffold context hassles.

Alternatives:

* fluttertoast — the classic toast package

* flushbar / another_flushbar — richer notifications

9. flutter_slider_drawer

What it is:
A sliding drawer menu UI.

Primary use:
Side menu that slides with animation (like a fancy navigation drawer).

Why use it:
Lets you build stylized drawer animations that standard Drawer can’t.

Alternatives:

* Built-in Drawer widget

* zoom_drawer — for zooming content drawer

10. flutter_cupertino_date_picker_fork

What it is:
A forked Cupertino-style date picker.

Primary use:
Let users pick dates/times in a scroll wheel style (iOS look).

Why use it:
More customizable than the default showDatePicker widget — and consistent iOS feel.

Alternatives:

* flutter_datetime_picker — simple cross-platform picker

* Use native showDatePicker + theme tweaks

---

11. velocity_x

What it is:
A utility-first Flutter framework that makes building UI faster using shorthand widgets & helpers.

What it’s used for:
Instead of writing long widget trees, VelocityX gives you concise, chainable UI helpers.
➡ Example:
Text("Hello").text.bold.xl.make()
instead of
Text("Hello", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))

Why use it:
✅ Speeds up UI building
✅ Cleaner, expressive code
✅ Lots of ready utility helpers (padding, text styles, colors)

Good alternatives:

* styled_widget — style widgets with chainable syntax

* flutter_layout_grid — for powerful layout control

* Plain Flutter with custom helper classes (no external lib)

2. flex_color_scheme

What it is:
A powerful Theme system for Flutter — builds beautiful light & dark themes with easy custom color schemes.

What it’s used for:
Generate polished, consistent theme setups with Material 3 support, tonal palettes, and ready presets.

Why use it:
✅ Better theme control than default ThemeData
✅ M3 support + dynamic animation
✅ Built-in color schemes and customizable tokens

Good alternatives:

* Core ThemeData + custom color logic

* dynamic_theme — switch themes dynamically

* provider + custom theme class

3. logger

What it is:
A logging utility to print structured logs in Dart/Flutter.

What it’s used for:
Print readable debug logs instead of cluttered print() output — includes level tags, timestamps, colors.

Why use it:
✅ Better debug logs
✅ Easy error/stack trace printing
✅ Configurable outputs

Good alternatives:

* dev.log (built-in Dart logging)

* flutter_bloc’s BlocObserver (if using BLoC)


## dev setup

1. Themes

create dir themes/app_theme.dart

then use flex_color_scheme and paste the codes from [flex_color_scheme](https://pub.dev/packages/flex_color_scheme) theme playground

2. Logger

create dir utils/app_logger.dart for more info visit [logger](https://pub.dev/packages/logger)

then use logger for logs



