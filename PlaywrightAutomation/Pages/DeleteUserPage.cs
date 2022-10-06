using Microsoft.Playwright;

namespace PlaywrightAutomation.Pages
{
    internal class DeleteUserPage : BasePage
    {
        public ILocator AlertText => Page.Locator("//div[contains(@class,'alert')]//h5");

        public string BuildAlertMessage(string userName)
        {
            return $"Are you sure you want to delete '{userName}' user";
        }
    }
}
