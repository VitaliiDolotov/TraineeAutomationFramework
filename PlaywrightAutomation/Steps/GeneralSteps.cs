using Microsoft.Playwright;
using PlaywrightAutomation.Providers;
using PlaywrightAutomation.Utils;
using TechTalk.SpecFlow;

namespace PlaywrightAutomation.Steps
{
    [Binding]
    internal class GeneralSteps : SpecFlowContext
    {
        private readonly BrowserFactory _browserFactory;
        private IPage _page;

        public GeneralSteps(BrowserFactory browserFactory)
        {
            _page = browserFactory.Page;
            _browserFactory = browserFactory;
        }

        [Given(@"User is on Automation trainee website")]
        public void GivenUserIsOnAutomationTraineeWebsite()
        {
            _page = _browserFactory
                .OpenNewPage(UrlProvider.Application)
                .GetAwaiter()
                .GetResult();
        }
    }
}
