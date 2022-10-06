using ChoETL;
using Microsoft.Playwright;
using PlaywrightAutomation.Extensions;

namespace PlaywrightAutomation.Components
{
    public class Button : BaseWebComponent
    {
        public override string Construct()
        {
            var selector = $"//*[@data-id='button-{Identifier.ToAutomationValue()}']";
            return selector;
        }

        public void Click(LoadState loadState)
        {
            Instance.ClickAsync().Reset();
            Page.WaitForLoadStateAsync(loadState).GetAwaiter().GetResult();
        }
    }
}