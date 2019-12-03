# AppStoreReviewManager
Very light drop in app store review manager for swift ios apps.

Easily prompt the user to rate your app after doing a certain number of actions and once for every version of the app.

Just add AppStoreReviewManager.swift to your project.

**How it works?**
1. change static let urlString = "https://itunes.apple.com/app/id1484470434" to your app link. You can find the app id in the itunesconnect page for your app even before app submission.
2. change static let minimumReviewWorthyActionCount = 5 to the number of actions that should be done before the user is prompted to rate the app.

**Then what?**
just put this line in your code when you want to show the prompt. For example in the viewdidload of the uiviewcontroller that you want to show in.

```
AppStoreReviewManager.requestReviewIfAppropriate(referennceVC: self)
```

![image](https://raw.githubusercontent.com/MhmdSalah/AppStoreReviewManager/master/review-prompt.png)
