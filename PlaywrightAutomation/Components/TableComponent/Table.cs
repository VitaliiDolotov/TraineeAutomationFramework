using Microsoft.Playwright;
using PlaywrightAutomation.Extensions;
using System.Collections.Generic;

namespace PlaywrightAutomation.Components.TableComponent
{
    internal class Table : BaseWebComponent
    {
        public ILocator Rows => Page.Locator("//tbody//tr");

        public override string Construct()
        {
            var selector = $"//table[@data-id='table-{Identifier.ToAutomationValue()}']";
            return selector;
        }

        public IElementHandle GetRow(List<KeyValuePair<string, string>> columnsWithData)
        {
            foreach (IElementHandle row in Rows.ElementHandlesAsync().Result)
            {
                if (IsRowContainsData(row, columnsWithData))
                    return row;
            }

            throw new System.Exception($"There are no row with appropriate information in '{Identifier}' table");
        }

        public bool IsRowContainsData(IElementHandle row, List<KeyValuePair<string, string>> columnAndData)
        {
            foreach (KeyValuePair<string, string> cell in columnAndData)
            {
                var cellText = Page.Component<TableData>(cell.Key)
                    .InnerTextAsync().Result
                    .Trim();

                if (!cellText.Equals(cell.Value))
                    return false;
            }

            return true;
        }
    }
}
