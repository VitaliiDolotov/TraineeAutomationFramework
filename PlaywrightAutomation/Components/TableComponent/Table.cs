using Microsoft.Playwright;
using PlaywrightAutomation.Extensions;
using System.Collections.Generic;

namespace PlaywrightAutomation.Components.TableComponent
{
    internal class Table : BaseWebComponent
    {
        public ILocator Rows => Instance.Locator("//tbody//tr");

        public override string Construct()
        {
            var selector = $"//table[@data-id='table-{Identifier.ToAutomationValue()}']";
            return selector;
        }

        public ILocator GetRow(List<KeyValuePair<string, string>> columnsWithData)
        {
            for (int i = 0; i < Rows.CountAsync().Result; i++)
            {
                if (IsRowContainsData(Rows.Nth(i), columnsWithData))
                    return Rows.Nth(i);
            }

            return null;
        }

        public bool IsRowContainsData(ILocator row, List<KeyValuePair<string, string>> columnAndData)
        {
            foreach (KeyValuePair<string, string> cell in columnAndData)
            {
                var cellText = Page.Component<TableData>(cell.Key, new Properties()
                {
                    Parent = row
                })
                    .InnerTextAsync().Result
                    .Trim();

                if (!cellText.Equals(cell.Value))
                    return false;
            }

            return true;
        }
    }
}
