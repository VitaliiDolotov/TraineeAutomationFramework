using FluentAssertions;
using Microsoft.Playwright;
using PlaywrightAutomation.Extensions;
using PlaywrightAutomation.Pages;
using PlaywrightAutomation.Utils;
using TechTalk.SpecFlow;

namespace PlaywrightAutomation.Steps.PageSteps
{
    [Binding]
    internal class DeleteUserPageSteps : SpecFlowContext
    {
        private readonly IPage _page;

        public DeleteUserPageSteps(BrowserFactory browserFactory)
        {
            _page = browserFactory.Page;
        }

        [Then(@"delete message is displayed for '([^']*)' user")]
        public void ThenDeleteMessageIsDisplayedForUser(string userName)
        {
            var deleteUserPage = _page.Init<DeleteUserPage>();
            var expectedMessage = deleteUserPage.BuildAlertMessage(userName);
            var actualMessage = deleteUserPage.AlertText.TextContentAsync().GetAwaiter().GetResult();

            expectedMessage.Should().Be(actualMessage);
        }
    }
}
