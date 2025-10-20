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
            var randomValue = new { 
                Id = new Random().Next(1, 100), 
                Name = "Random Item",
                Timestamp = DateTime.UtcNow 
            };
            return Ok(randomValue);
        }

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            if (id <= 0)
            {
                return BadRequest("ID must be a positive number");
            }

            var randomValue = new { 
                Id = id, 
                Name = $"Random Item {id}",
                Value = new Random().NextDouble() * 100
            };
            return Ok(randomValue);
        }

        [HttpPost]
        public IActionResult Post([FromBody] object data)
        {
            _logger.LogInformation("Received POST request with data");
            return Ok(new { message = "Data received successfully", timestamp = DateTime.UtcNow });
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] object data)
        {
            if (id <= 0)
            {
                return BadRequest("ID must be a positive number");
            }

            _logger.LogInformation($"Received PUT request for ID {id}");
            return Ok(new { message = $"Item {id} updated successfully", id = id });
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            if (id <= 0)
            {
                return BadRequest("ID must be a positive number");
            }

            _logger.LogInformation($"Deleting item with ID {id}");
            return Ok(new { message = $"Item {id} deleted successfully", id = id });
        }
    }
}