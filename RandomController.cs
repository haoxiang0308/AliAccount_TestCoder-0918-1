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
                return BadRequest("Invalid ID");
            }

            var randomValue = new { 
                Id = id, 
                Name = $"Random Item {id}", 
                Value = new Random().NextDouble() 
            };
            return Ok(randomValue);
        }

        [HttpPost]
        public IActionResult Post([FromBody] object data)
        {
            _logger.LogInformation("Received POST request with data");
            
            var response = new { 
                Success = true, 
                Message = "Data received successfully", 
                ProcessedAt = DateTime.UtcNow 
            };
            return Ok(response);
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] object data)
        {
            if (id <= 0)
            {
                return BadRequest("Invalid ID");
            }

            var response = new { 
                Success = true, 
                Message = $"Item {id} updated successfully", 
                UpdatedAt = DateTime.UtcNow 
            };
            return Ok(response);
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            if (id <= 0)
            {
                return BadRequest("Invalid ID");
            }

            var response = new { 
                Success = true, 
                Message = $"Item {id} deleted successfully", 
                DeletedAt = DateTime.UtcNow 
            };
            return Ok(response);
        }
    }
}