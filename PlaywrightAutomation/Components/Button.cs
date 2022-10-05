using PlaywrightAutomation.Extensions;

namespace PlaywrightAutomation.Components
{
    public class Button : BaseWebComponent
    {
        public override string Construct()
        {
            var selector = $"//button[@data-id='button-{Identifier.ToAutomationValue()}']";
            return selector;
        }
    }
}