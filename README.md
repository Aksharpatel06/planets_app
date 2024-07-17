# planets_app


Sure, let's create a comprehensive description for a Flutter app that simulates a solar system, including Shared Preferences, explicit and implicit animations, local JSON data, fetching planet details, an add-to-favorites feature, and detailed screens for each planet.

### Solar System App in Flutter

#### 1. **Shared Preferences**
**Description:**
Utilize Shared Preferences to save user settings, such as favorite planets and app preferences, across sessions. This allows for a personalized user experience that persists even after the app is closed.

**Implementation Steps:**
- Add `shared_preferences` package to your `pubspec.yaml`.
- Initialize SharedPreferences instance.
- Use methods like `setString()`, `setInt()`, and `setBool()` to store user data.
- Retrieve data using `getString()`, `getInt()`, and `getBool()`.

#### 2. **Explicit Animation**
**Description:**
Explicit animations allow you to control the animation steps manually, providing a detailed and smooth animation experience for elements like rotating planets or moving objects.

**Implementation Steps:**
- Use the `AnimationController` to manage the animation duration and control.
- Create `Animation` objects for different properties like rotation, scale, or position.
- Use `AnimatedBuilder` or `AnimatedWidget` to rebuild and animate widgets based on the animation values.

#### 3. **Implicit Animation**
**Description:**
Implicit animations simplify the animation process by automatically animating changes in widget properties, such as size, position, or color, making it easy to create smooth transitions.

**Implementation Steps:**
- Use implicit animation widgets like `AnimatedContainer`, `AnimatedOpacity`, and `AnimatedPositioned`.
- Define the target state changes and let Flutter handle the animation between states.

#### 4. **Local JSON Data**
**Description:**
Store planet details in a local JSON file to load planet data such as name, description, distance from the sun, and other attributes. This allows the app to function offline and provides quick access to planet information.

**Implementation Steps:**
- Add a JSON file to your assets directory containing planet details.
- Load the JSON data using Flutter's `rootBundle`.
- Parse the JSON data into a list of planet objects using Dart's `jsonDecode`.

#### 5. **Fetch Planet Details**
**Description:**
Display detailed information for each planet by fetching data either from a local JSON file or an API. Provide users with comprehensive details about each planet, including images, descriptions, and fun facts.

**Implementation Steps:**
- Fetch planet details from the local JSON file or API.
- Parse the data and create a model class for planets.
- Display the data in a detailed view when a planet is selected.

#### 6. **Add to Favorite Feature**
**Description:**
Allow users to mark planets as favorites and store these preferences using Shared Preferences. This feature enhances user engagement by letting them easily access their favorite planets.

**Implementation Steps:**
- Use a `List<String>` to store favorite planet IDs or names in Shared Preferences.
- Provide a UI element (e.g., a star icon) for users to mark/unmark favorites.
- Save the updated list to Shared Preferences and update the UI accordingly.

#### 7. **Detail Screen for Each Planet**
**Description:**
Create a dedicated screen for each planet displaying detailed information, images, and animations. This screen should provide an immersive experience with rich content and smooth animations.

**Implementation Steps:**
- Use a `Navigator` to push a new screen when a planet is selected.
- Design the detail screen layout to include planet images, descriptions, and other relevant details.
- Use animations to enhance the user experience, such as rotating planets or animating text transitions.


### ScreenShort [Source Code](https://github.com/Aksharpatel06/planets_app/tree/master/lib)

<p align='center'>
  <img src='https://github.com/user-attachments/assets/8d5eed17-c99e-4110-be67-08008090634e' width=240> &nbsp;&nbsp;&nbsp;
  <img src='https://github.com/user-attachments/assets/bb694f95-c0d0-46f1-97a4-ff6726029d14' width=240> &nbsp;&nbsp;&nbsp;
  <img src='https://github.com/user-attachments/assets/a4ac764d-f093-44a9-a0c1-15e1074b6a8d' width=240> &nbsp;&nbsp;&nbsp;
  <img src='https://github.com/user-attachments/assets/814f1106-513e-4502-8bc9-4e9e30df9f03' width=240> &nbsp;&nbsp;&nbsp;
  <img src='https://github.com/user-attachments/assets/5d2dd5d0-b287-4cb4-892d-08b3543145ed' width=240> &nbsp;&nbsp;&nbsp;
</p>


### Video

https://github.com/user-attachments/assets/59d15bea-b706-422e-b9b7-bda1d2fcca07



https://github.com/user-attachments/assets/d39654f9-9bad-4490-853b-387027253d06


