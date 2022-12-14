using Microsoft.Playwright;

namespace PlaywrightAutomation.Pages
{
    internal class DeleteAddressPage : BasePage
    {
        public ILocator AlertText => Page.Locator("//div[contains(@class,'alert')]//h5");

        public string BuildAlertMessage(string Address)
        {
            return $"Are you sure you want to delete address with '{Address}' street";
        }
    }
}
