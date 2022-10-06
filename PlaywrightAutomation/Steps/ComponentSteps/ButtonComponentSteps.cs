using Microsoft.Playwright;
using PlaywrightAutomation.Components;
using PlaywrightAutomation.Extensions;
using PlaywrightAutomation.Utils;
using System.Threading;
using System.Xml;
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
            _page.Component<Button>(button).Click(LoadState.DOMContentLoaded);
            Thread.Sleep(2000);
        }
    }
}
