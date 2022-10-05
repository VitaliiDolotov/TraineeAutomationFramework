using Microsoft.Playwright;
using PlaywrightAutomation.Extensions;
using PlaywrightAutomation.Pages;
using PlaywrightAutomation.Utils;
using TechTalk.SpecFlow;

namespace PlaywrightAutomation.Steps.PageSteps
{
    [Binding]
    internal class HeaderPageSteps : SpecFlowContext
    {
        private readonly IPage _page;

        public HeaderPageSteps(BrowserFactory browserFactory)
        {
            _page = browserFactory.Page;
        }

        [When(@"User navigates to '([^']*)' page")]
        public void WhenUserNavigatesToPage(string navigationItem)
        {
            _page.Init<HeaderPage>()
                .GetNavigationItem(navigationItem)
                .ClickAsync().GetAwaiter().GetResult();
        }
    }
}
