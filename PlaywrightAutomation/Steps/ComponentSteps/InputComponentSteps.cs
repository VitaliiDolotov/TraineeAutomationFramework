using Microsoft.Playwright;
using PlaywrightAutomation.Components;
using PlaywrightAutomation.Extensions;
using PlaywrightAutomation.Utils;
using TechTalk.SpecFlow;

namespace PlaywrightAutomation.Steps.ComponentSteps
{
    [Binding]
    internal class InputComponentSteps : SpecFlowContext
    {
        private readonly IPage _page;

        public InputComponentSteps(BrowserFactory browserFactory)
        {
            _page = browserFactory.Page;
        }

        [When(@"User enters '([^']*)' text to '([^']*)' input")]
        public void WhenUserEntersTextToInput(string text, string input)
        {
            _page.Component<Input>(input).TypeAsync(text).GetAwaiter().GetResult();
        }
    }
}
