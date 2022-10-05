using PlaywrightAutomation.Extensions;

namespace PlaywrightAutomation.Components.TableComponent
{
    internal class TableData : BaseWebComponent
    {
        public override string Construct()
        {
            var selector = $"//td[@data-id='td-{Identifier.ToAutomationValue()}']";
            return selector;
        }
    }
}
