using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers
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
            var randomData = new
            {
                Id = new Random().Next(1, 100),
                Name = "Random Item",
                Timestamp = DateTime.UtcNow
            };
            
            return Ok(randomData);
        }

        // GET: api/random/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var randomData = new
            {
                Id = id,
                Name = $"Random Item {id}",
                Value = new Random().NextDouble() * 100
            };
            
            return Ok(randomData);
        }

        // POST: api/random
        [HttpPost]
        public IActionResult Post([FromBody] object value)
        {
            _logger.LogInformation("POST request received with value: {Value}", value);
            
            return CreatedAtAction(nameof(Get), new { id = new Random().Next(1, 100) }, value);
        }

        // PUT: api/random/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] object value)
        {
            _logger.LogInformation("PUT request received for ID: {Id} with value: {Value}", id, value);
            
            return NoContent();
        }

        // DELETE: api/random/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            _logger.LogInformation("DELETE request received for ID: {Id}", id);
            
            return NoContent();
        }
    }
}