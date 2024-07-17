Test café infinite loop when screenshot folder isn't writable
===

This is a example project to document a bug with not writable screenshot or video folder that sends test café into an infinite loop.


To test this (You need docker execution rights):
```bash
git clone https://github.com/belug23/test-cafe-infinite-loop.git
cd test-cafe-infinite-loop
docker run --rm --name testcafe-infinite-loop -v $(pwd)/tests:/tests -v $(pwd)/screenshots:/screenshots -e DEBUG='testcafe*' -it testcafe/testcafe "chromium:headless:width=1600;height=900"  -s /screenshots/ --screenshots-full-page -S
```

The `screenshots/` folder will be created by docker with Root as a owner and test café will go into an infinite loop.

To validate that it's only because of the write access, you can change the permissions on the `screenshots/` folder to the uid 1000 and run the docker again.
```bash
sudo chown 1000:1000 screenshots
docker run --rm --name testcafe-infinite-loop -v $(pwd)/tests:/tests -v $(pwd)/screenshots:/screenshots -e DEBUG='testcafe*' -it testcafe/testcafe "chromium:headless:width=1600;height=900"  -s /screenshots/ --screenshots-full-page -S
```
Now it'll fail properly and save a screenshot of the failure.