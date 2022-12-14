using FluentAssertions;
using Microsoft.Playwright;
using PlaywrightAutomation.Extensions;
using PlaywrightAutomation.Pages;
using PlaywrightAutomation.Utils;
using TechTalk.SpecFlow;

namespace PlaywrightAutomation.Steps.PageSteps
{
    [Binding]
    internal class DeleteAddressPageSteps : SpecFlowContext
    {
        private readonly IPage _page;

        public DeleteAddressPageSteps(BrowserFactory browserFactory)
        {
            _page = browserFactory.Page;
        }

        [Then(@"Delete message is displayed for '([^']*)' Address")]
        public void ThenDeleteMessageIsDisplayedForAddress(string Address)
        {
            var deleteAddressPage = _page.Init<DeleteAddressPage>();
            var expectedMessage = deleteAddressPage.BuildAlertMessage(Address);
            var actualMessage = deleteAddressPage.AlertText.TextContentAsync().GetAwaiter().GetResult();

            expectedMessage.Should().Be(actualMessage);
        }
    }
}
