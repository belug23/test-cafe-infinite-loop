fixture('Getting Started')
    .page('https://devexpress.github.io/testcafe/example');

test('My first test', async t => {
    await t.typeText('#developer-name-error', 'John Smith');
});