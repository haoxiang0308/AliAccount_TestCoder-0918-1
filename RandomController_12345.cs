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
            var items = new[]
            {
                new { Id = 1, Name = "Item 1", Description = "This is the first item" },
                new { Id = 2, Name = "Item 2", Description = "This is the second item" },
                new { Id = 3, Name = "Item 3", Description = "This is the third item" }
            };

            return Ok(items);
        }

        // GET: api/random/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var item = new { Id = id, Name = $"Item {id}", Description = $"This is item {id}" };
            
            if (item == null)
            {
                return NotFound();
            }

            return Ok(item);
        }

        // POST: api/random
        [HttpPost]
        public IActionResult Post([FromBody] dynamic value)
        {
            // In a real application, you would validate and process the input
            _logger.LogInformation("Creating a new item");
            
            // Return a success response with the created item
            return CreatedAtAction(nameof(Get), new { id = 4 }, value);
        }

        // PUT: api/random/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] dynamic value)
        {
            // In a real application, you would update the item with the specified id
            _logger.LogInformation($"Updating item with ID: {id}");
            
            return NoContent();
        }

        // DELETE: api/random/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            // In a real application, you would delete the item with the specified id
            _logger.LogInformation($"Deleting item with ID: {id}");
            
            return NoContent();
        }
    }
}