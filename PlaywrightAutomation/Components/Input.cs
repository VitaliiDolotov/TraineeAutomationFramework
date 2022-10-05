using PlaywrightAutomation.Extensions;

namespace PlaywrightAutomation.Components
{
    internal class Input : BaseWebComponent
    {
        public override string Construct()
        {
            var selector = $"//input[@data-id='input-{Identifier.ToAutomationValue()}']";
            return selector;
        }
    }
}