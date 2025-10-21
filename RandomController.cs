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
            var randomData = new
            {
                Id = new Random().Next(1, 100),
                Name = "Random Item",
                Value = new Random().NextDouble() * 100
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
            _logger.LogInformation("POST endpoint called with value: {Value}", value);
            return Ok(new { message = "Random item created successfully", value });
        }

        // PUT: api/random/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] object value)
        {
            _logger.LogInformation("PUT endpoint called for id: {Id} with value: {Value}", id, value);
            return Ok(new { message = $"Random item {id} updated successfully", value });
        }

        // DELETE: api/random/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            _logger.LogInformation("DELETE endpoint called for id: {Id}", id);
            return Ok(new { message = $"Random item {id} deleted successfully" });
        }
    }
}