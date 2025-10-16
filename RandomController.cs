using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RandomController : ControllerBase
    {
        private readonly ILogger<RandomController> _logger;

        public RandomController(ILogger<RandomController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public IActionResult Get()
        {
            var random = new Random();
            var randomNumber = random.Next(1, 100);
            return Ok(new { message = "Random number generated", value = randomNumber });
        }

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            if (id <= 0)
            {
                return BadRequest("ID must be a positive number");
            }
            
            return Ok(new { id = id, description = $"Item with ID {id}" });
        }

        [HttpPost]
        public IActionResult Post([FromBody] object data)
        {
            _logger.LogInformation("POST endpoint called with data: {@Data}", data);
            return Ok(new { message = "Data received successfully", timestamp = DateTime.UtcNow });
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] object data)
        {
            if (id <= 0)
            {
                return BadRequest("ID must be a positive number");
            }
            
            _logger.LogInformation("PUT endpoint called for ID: {Id} with data: {@Data}", id, data);
            return Ok(new { message = $"Item {id} updated successfully", id = id });
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            if (id <= 0)
            {
                return BadRequest("ID must be a positive number");
            }
            
            _logger.LogInformation("DELETE endpoint called for ID: {Id}", id);
            return Ok(new { message = $"Item {id} deleted successfully", id = id });
        }
    }
}