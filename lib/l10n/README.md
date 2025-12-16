# Localization System

This project uses Flutter's official `intl` package for internationalization (i18n) and localization (l10n).

## Structure

```
lib/
  l10n/
    app_en.arb          # English translations (template)
    app_localizations.dart  # Generated localization class
    app_localizations_en.dart  # Generated English implementation
  core/
    utilities/
      localization_extension.dart  # Helper extension for easy access
l10n.yaml               # Localization configuration
```

## How to Use

### 1. Accessing Translations in Widgets

Use the `context.l10n` extension for easy access:

```dart
import 'package:loni_africa/core/utilities/localization_extension.dart';

// In your widget:
Text(context.l10n.signIn)
Text(context.l10n.welcomeBack)
```

### 2. Translations with Parameters

For dynamic content with placeholders:

```dart
// In ARB file:
"foundResults": "Found {count} results for \"{query}\"",
"@foundResults": {
  "placeholders": {
    "count": {"type": "int"},
    "query": {"type": "String"}
  }
}

// In your widget:
Text(context.l10n.foundResults(24, 'Chinua Achebe'))
```

### 3. Adding New Translations

1. Add new keys to `lib/l10n/app_en.arb`:
   ```json
   "myNewKey": "My translation text"
   ```

2. Regenerate localization files:
   ```bash
   flutter gen-l10n
   ```

3. Use in your code:
   ```dart
   Text(context.l10n.myNewKey)
   ```

### 4. Adding a New Language

1. Create a new ARB file (e.g., `app_fr.arb` for French):
   ```bash
   cp lib/l10n/app_en.arb lib/l10n/app_fr.arb
   ```

2. Update the locale in the new file:
   ```json
   {
     "@@locale": "fr",
     "signIn": "Se connecter",
     ...
   }
   ```

3. Add the locale to `main.dart`:
   ```dart
   supportedLocales: const [
     Locale('en'), // English
     Locale('fr'), // French
   ],
   ```

4. Regenerate:
   ```bash
   flutter gen-l10n
   ```

## Available Translations

### Authentication
- `signIn`, `signUp`, `welcomeBack`, `createAccount`
- `enterEmail`, `enterPassword`, `enterName`
- `forgotPassword`, `dontHaveAccount`, `alreadyHaveAccount`
- `orContinueWith`, `google`, `apple`
- `emailLabel`, `passwordLabel`, `nameLabel`, `phoneLabel`
- `verifyPhone`, `enterOtp`, `didntReceiveCode`, `resend`, `verify`
- `continueButton`

### Onboarding
- `onboardingTitle1`, `onboardingDesc1`
- `onboardingTitle2`, `onboardingDesc2`
- `onboardingTitle3`, `onboardingDesc3`
- `skip`, `next`, `getStarted`

### Home Screen
- `goodMorning`, `goodAfternoon`, `goodEvening`, `goodNight`
- `searchBooksAuthors`, `continueReading`
- `trendingNow`, `browseByGenre`, `newReleases`
- `seeAll`, `hot`, `digital`
- `booksCount(count)` - with parameter

### Search
- `searchForBooks`
- `foundResults(count, query)` - with parameters
- `all`, `books`, `authors`, `publishers`, `view`
- `reviews(count)` - with parameter

### Categories
- `categories`, `fiction`, `history`, `poetry`, `children`
- `education`, `selfHelp`, `business`, `romance`
- `popular`, `newFilter`, `bestsellers`, `priceLow`
- `booksInCategory(count, category)` - with parameters

### Author Page
- `nigerianNovelist`, `readers`, `rating`
- `followAuthor`, `about`, `popularBooks`

### Publisher Page
- `publisher`, `africanWritersSeries`
- `followPublisher`, `latestReleases`

### Trending
- `trending`
- `topBooksThisWeek(country)` - with parameter
- `nigeria`, `kenya`, `southAfrica`, `ghana`
- `fromLastWeek(change)` - with parameter
- `noChange`

### Featured Collection
- `featured`, `collection`
- `aboutThisCollection`, `booksInCollection`
- `avgRating`, `add`

### Library
- `library`, `myBooks`, `favorites`, `downloaded`

### Profile
- `profile`, `settings`, `notifications`
- `language`, `theme`, `logout`

### Navigation
- `home`, `explore`

### Common
- `cancel`, `ok`, `delete`, `edit`, `save`, `close`
- `loading`, `error`, `retry`, `success`

## Important Notes

### Avoiding Dart Keywords

Never use Dart keywords as translation keys:
- ❌ `new`, `continue`, `class`, `if`, `else`, etc.
- ✅ `newFilter`, `continueButton`, `className`, etc.

### ARB File Format

- Must be valid JSON
- Use camelCase for keys
- Document complex translations with `@` prefix
- Always specify placeholder types

### Regeneration

Run `flutter gen-l10n` whenever you:
- Add new translation keys
- Modify existing keys
- Add new language files
- Change placeholder definitions

## Configuration

The `l10n.yaml` file configures the localization system:

```yaml
arb-dir: lib/l10n                      # Where ARB files are located
template-arb-file: app_en.arb          # Template file (usually English)
output-localization-file: app_localizations.dart  # Generated class name
```

## Best Practices

1. **Always use localization** - Never hardcode user-facing strings
2. **Descriptive keys** - Use clear, semantic key names
3. **Group by feature** - Keep related translations together in ARB file
4. **Comment complex items** - Use ARB comments for context
5. **Test all languages** - Verify translations in UI before release
6. **Keep consistent** - Use same tone and style across translations

## Troubleshooting

### "AppLocalizations not found in context"
- Ensure you've added localization delegates in `MaterialApp`
- Check that you're not accessing `context.l10n` outside the widget tree

### Generated files not updating
- Run `flutter clean && flutter pub get`
- Run `flutter gen-l10n` again
- Restart your IDE

### Invalid ARB format
- Validate JSON syntax
- Check for trailing commas
- Ensure all placeholder definitions match usage
