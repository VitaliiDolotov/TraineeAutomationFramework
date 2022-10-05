using FluentAssertions;
using Microsoft.Playwright;
using PlaywrightAutomation.Components;
using PlaywrightAutomation.Extensions;
using PlaywrightAutomation.Utils;
using TechTalk.SpecFlow;

namespace PlaywrightAutomation.Steps.ComponentSteps
{
    [Binding]
    internal class PageHeaderComponentSteps : SpecFlowContext
    {
        private readonly IPage _page;

        public PageHeaderComponentSteps(BrowserFactory browserFactory)
        {
            _page = browserFactory.Page;
        }

        [Then(@"'([^']*)' page is opened")]
        public void ThenPageIsOpened(string headerText)
        {
            var actualPageHeaderText =
                _page.Component<PageHeader>().InnerTextAsync().GetAwaiter().GetResult();

            actualPageHeaderText.Should().Be(headerText);
        }
    }
}
