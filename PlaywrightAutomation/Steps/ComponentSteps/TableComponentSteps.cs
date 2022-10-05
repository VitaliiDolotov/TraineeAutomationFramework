using FluentAssertions;
using Microsoft.Playwright;
using PlaywrightAutomation.Extensions;
using PlaywrightAutomation.Utils;
using System.Collections.Generic;
using System.Linq;
using TechTalk.SpecFlow;

namespace PlaywrightAutomation.Steps.ComponentSteps
{
    [Binding]
    internal class TableComponentSteps : SpecFlowContext
    {
        private readonly IPage _page;

        public TableComponentSteps(BrowserFactory browserFactory)
        {
            _page = browserFactory.Page;
        }

        [Then(@"following data is displayed in '([^']*)' table")]
        public void ThenFollowingDataIsDisplayedInTable(string tableName, Table table)
        {
            var columnsWithData = new List<KeyValuePair<string, string>>();
            foreach(TableRow tr in table.Rows)
            {
                columnsWithData.Add(new KeyValuePair<string, string>(tr.Values.First(), tr.Values.Last()));
            }

            var tableElement = _page.Component<Components.TableComponent.Table>(tableName);
            var tableRow = tableElement.GetRow(columnsWithData);

            tableRow.Should().NotBeNull();
        }
    }
}
