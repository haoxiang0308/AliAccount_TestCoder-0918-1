using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class b905fc0d73a46884Controller : ControllerBase
    {
        private readonly ILogger<b905fc0d73a46884Controller> _logger;

        public b905fc0d73a46884Controller(ILogger<b905fc0d73a46884Controller> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public IActionResult Get()
        {
            return Ok(new { message = "Hello from the randomly named controller!", randomId = "b905fc0d73a46884" });
        }

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            return Ok(new { id = id, message = $"Item with ID {id} from controller b905fc0d73a46884" });
        }

        [HttpPost]
        public IActionResult Post([FromBody] object data)
        {
            _logger.LogInformation("Received POST request in b905fc0d73a46884Controller");
            return Ok(new { message = "POST request received successfully", data, controller = "b905fc0d73a46884Controller" });
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] object data)
        {
            _logger.LogInformation($"Received PUT request for ID {id} in b905fc0d73a46884Controller");
            return Ok(new { message = $"Item with ID {id} updated successfully", data, controller = "b905fc0d73a46884Controller" });
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            _logger.LogInformation($"Received DELETE request for ID {id} in b905fc0d73a46884Controller");
            return Ok(new { message = $"Item with ID {id} deleted successfully", controller = "b905fc0d73a46884Controller" });
        }
    }
}