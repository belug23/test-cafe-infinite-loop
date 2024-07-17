#!/usr/bin/env sh

docker run --rm --name testcafe-infinite-loop -v $(pwd)/tests:/tests -v $(pwd)/screenshots:/screenshots -e DEBUG='testcafe*' -it testcafe/testcafe "chromium:headless:width=1600;height=900"  -s /screenshots/ --screenshots-full-page -S