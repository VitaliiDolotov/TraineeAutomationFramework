using FluentAssertions;
using Microsoft.Playwright;
using PlaywrightAutomation.Components;
using PlaywrightAutomation.Extensions;
using PlaywrightAutomation.Utils;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
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
            foreach (TableRow tr in table.Rows)
            {
                columnsWithData.Add(new KeyValuePair<string, string>(tr.Values.First(), tr.Values.Last()));
            }

            var tableElement = _page.Component<Components.TableComponent.Table>(tableName);
            var tableRow = tableElement.GetRow(columnsWithData);

            tableRow.Should().NotBeNull();
        }

        [When(@"User clicks '([^']*)' button in '([^']*)' table for row with data")]
        public void WhenUserClicksButtonInTableForRowWithData(string buttonName, string tableName, Table table)
        {
            var columnsWithData = new List<KeyValuePair<string, string>>();
            foreach (TableRow tr in table.Rows)
            {
                columnsWithData.Add(new KeyValuePair<string, string>(tr.Values.First(), tr.Values.Last()));
            }

            var tableElement = _page.Component<Components.TableComponent.Table>(tableName);
            var tableRow = tableElement.GetRow(columnsWithData);

            _page.Component<Button>(buttonName, new BaseWebComponent.Properties() { Parent = tableRow }).ClickAsync().GetAwaiter().GetResult();

            // TODO Replace static sleep
            Thread.Sleep(1500);
        }
    }
}
