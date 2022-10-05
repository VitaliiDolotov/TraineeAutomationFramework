using Microsoft.Playwright;
using System.Linq;

namespace PlaywrightAutomation.Pages
{
    internal class HeaderPage : BasePage
    {
        public ILocator Title => Page.Locator("//a[@class='navbar-brand']");

        public ILocator NavigationItems => Page.Locator("//ul[contains(@class,'navbar-nav')]/li");

        public IElementHandle GetNavigationItem(string itemName)
        {
            var item = NavigationItems
                .ElementHandlesAsync().Result
                .First(x => x.InnerTextAsync().Result.Equals(itemName));
            return item;
        }
    }
}
