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
            var inputElement = _page.Component<Input>(input);
            inputElement.FillAsync(string.Empty).GetAwaiter().GetResult();
            inputElement.TypeAsync(text).GetAwaiter().GetResult();
        }
    }
}
