using Microsoft.Playwright;
using PlaywrightAutomation.Components;
using PlaywrightAutomation.Extensions;
using PlaywrightAutomation.Utils;
using TechTalk.SpecFlow;

namespace PlaywrightAutomation.Steps.ComponentSteps
{
    [Binding]
    internal class ButtonComponentSteps : SpecFlowContext
    {
        private readonly IPage _page;

        public ButtonComponentSteps(BrowserFactory browserFactory)
        {
            _page = browserFactory.Page;
        }

        [When(@"User clicks '([^']*)' button")]
        public void WhenUserClicksButton(string button)
        {
            _page.Component<Button>(button).ClickAsync().GetAwaiter().GetResult();
            _page.WaitForLoadStateAsync(LoadState.DOMContentLoaded).GetAwaiter().GetResult();
        }
    }
}
