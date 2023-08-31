日本語は下記を参照（予定）。

# NAVER LINE database merger
Restore your chat history by merging your backup to your new install of LINE.


## Requirements
- A ROOTed Android phone
- A previous backup & current copy of your `naver_line` database retrieved from `jp.naver.line.android/databases/naver_line`


## Use-case
You make a backup of your LINE app data, e.g. by setting-up [Syncthing](https://syncthing.net/).
Then you got a new phone and maybe your old phone has died.
You might have tried to keep all your LINE data with the method described here:
https://android.stackexchange.com/a/225948

But this failed or was not possible from the start.
Instead you installed LINE fresh and "lost your chat history", but you do still have your old `naver_line` db with your chat history.

Following the steps in this repo and executing the SQL effectively merges your old chat history with the `naver_line` db used in your current version of the LINE app.


## Execution steps
1. Download "DB Browser for SQLite": https://sqlitebrowser.org/
2. Open the latest `naver_line` DB with DB Browser
3. Click "Attach Database" in toolbar and select your old `naver_line`
    - When searching for your file, change "Files of type" to "All files (*)" (`naver_line` file has no extension)
    - Name it `old` when the dialog appears with "Please specify the database name ..."
4. Go to "Execute SQL" tab and copy+paste the SQL code found in: `sql/*.sql` in order


## Setting back new database
0. Close the LINE app and Force Stop (App info) it. Also turn-off wifi/internet
1. Copy the db file to your Android device's internal memory
2. With a file navigator app that has root access (e.g. "Total Commander"), go to your LINE app install location
    - Could be: `/data_mirror/data_ce/null/0/jp.naver.line.android/databases`
3. Select the db file `naver_line`, properties, and note down the UID & GID
4. With file navigator, go to your new merged db file `naver_line` and change UID & GID to what you noted down in the previous step
5. Rename the original `naver_line` in `jp.naver.line.android/databases` to e.g. `naver_line_bak`
6. Copy over your new `naver_line` to `jp.naver.line.android/databases`
7. Just to be sure, restart your device
8. Open the LINE app. At first you see nothing different, but if you scroll up in a chat your history is there!

### Notes
- Not sure how to recover images shared in chat yet.
    - Seems `storage/Android/data/jp.naver.line.android/storage/` might hold the clue
- Chats that haven't seen a new message since you reinstalled LINE do not show up (but have all your chat history)
    - These do appear if you select the chat from your home screen. The message will be shown as from 1970/1/1 though
- Search for old chat history seems broken :/ Even after you have openend an old chat.



# NAVER LINE データベース統合
TODO

