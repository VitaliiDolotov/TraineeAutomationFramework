namespace PlaywrightAutomation.Components
{
    internal class PageHeader : BaseWebComponent
    {
        public override string Construct()
        {
            var selector = "//h1";
            return selector;
        }
    }
}
