# SECURE

### Summary

Mobile application to create secure passwords which are user personalized but untraceable through social media. Each user has an individual account wherein a survey of obscure, personal questions is conducted and cross-reviewed against the user’s social media platforms. Any matches are removed from consideration in terms of password viability. Passwords are created by meshing different answers and encrypted in personal user database. User has access to a list of passwords and the application/content of use.

### Minimum Viable Product

Users participate in survey and answers are cross-referenced to users instagram profile. Passwords are encrypted and stored in personal user database.

| Feature | Description |
| ------- | ----------- |
| Personal Questions | Mother’s maiden name, first partner’s name, favorite city of visit, etc |
| Instagram sweeping | Access user’s personal account and process each caption, tag, and location |
| Personal database | Compilation of user passwords and application (encrypted) |

### Stretch Goals

  - Implement password privacy measures for extra security (ex. Padding, formulas, etc.)
  - Have user determine factors such as password length and complexity
  - Implement facebook sweeping in addition to instagram such that there is a more holistic social media scanning process
  - Create random survey questions such that not every account has the same set of questions
  - Have option to log onto desired application/account directly from password database
  
### Technologies

[React Native](https://codeburst.io/setting-up-development-environment-using-react-native-on-windows-dd240e69f776)
  - React native will be used in preference over Android Studio for reasons of cross-platform compatibility and cleaner design. The language of use will be javascript. If the learning curve is too steep for the group then a fallback plan of using Android Studio and Java will be pursued.
  
[Instagram API](https://rapidapi.com/blog/how-to-navigate-and-connect-to-instagrams-api/)
  - Retrieve basic user information from instagram account. This includes posts, captions, tags, bio, etc.
  
[Firebase](https://blog.jscrambler.com/integrating-firebase-with-react-native/)
  - Manage personal user accounts through google email and personal password. Will hold encrypted passwords and user survey information. Potentially debating holding social media sweep information or having a sweep done every time a new password is being created.

### Helpful Links

  - [Password Strength Techniques](https://breachalarm.com/creating-great-passwords)
  - [Firebase Encryption](https://stackoverflow.com/questions/38304258/how-to-encrypt-user-data-in-firebase)
  - [Common Password Apps](https://www.digitaltrends.com/computing/best-password-managers/)
  - [Instagram API Access Token](https://www.youtube.com/watch?v=WTBqQQN910A)
  - [Instagram Profile Scraping](https://www.youtube.com/watch?v=-ptpQ22t2j0)
