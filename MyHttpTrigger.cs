using System.IO;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace MyCompany.Functions
{
    public static class MyHttpTrigger
    {
        [FunctionName("MyHttpTrigger")]
        public static IActionResult Run(
            [HttpTrigger(AuthorizationLevel.Function, "get", "post", "put", "delete", Route = "myroute")] HttpRequest req,
            ILogger log)
        {
            log.LogInformation("My HTTP trigger function processed a request.");

            string name = req.Query["name"];
            string action = req.Query["action"];

            string requestBody = new StreamReader(req.Body).ReadToEnd();
            dynamic data = JsonConvert.DeserializeObject(requestBody);
            name = name ?? data?.name;
            action = action ?? data?.action;

            string responseMessage = string.IsNullOrEmpty(name)
                ? "Welcome to my Azure HTTP function! Provide a name parameter to get a personalized message."
                : $"Hello {name}! You triggered the {action ?? "default"} action.";

            return new OkObjectResult(responseMessage);
        }
    }
}