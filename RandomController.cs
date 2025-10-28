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

        // GET: api/random
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

        // GET: api/random/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var randomValue = new { 
                Id = id, 
                Name = $"Random Item {id}",
                Value = new Random().NextDouble(),
                Timestamp = DateTime.UtcNow 
            };
            
            return Ok(randomValue);
        }

        // POST: api/random
        [HttpPost]
        public IActionResult Post([FromBody] object data)
        {
            var response = new { 
                Success = true, 
                Message = "Data received successfully",
                ReceivedAt = DateTime.UtcNow 
            };
            
            return Ok(response);
        }

        // PUT: api/random/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] object data)
        {
            var response = new { 
                Success = true, 
                Message = $"Item {id} updated successfully",
                UpdatedAt = DateTime.UtcNow 
            };
            
            return Ok(response);
        }

        // DELETE: api/random/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            var response = new { 
                Success = true, 
                Message = $"Item {id} deleted successfully",
                DeletedAt = DateTime.UtcNow 
            };
            
            return Ok(response);
        }
    }
}